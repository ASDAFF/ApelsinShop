<?php
/**
 * Description of TextGenerator
 *
 * @author Максим
 */
class TextGenerator {
    static private $punctuationMark = array(',', '.', '!', '?', ':', ';', '...');
    static private $releasingCharacters = array('(', ')', '[', ']', '{', '}', '"', "'", '«', '»');
    static private $vowels = array('A', 'а', 'Е', 'е', 'Ё', 'ё', 'И', 'и', 'О', 
        'о', 'У', 'у', 'Ы', 'ы', 'Э', 'э', 'Ю', 'ю', 'Я', 'я');
    static private $consonants = array('Б', 'б', 'В', 'в', 'Г', 'г', 'Д', 'д', 
        'Ж', 'ж', 'З', 'з', 'Й', 'й', 'К', 'к', 'Л', 'л', 'М', 'м', 'Н', 'н', 
        'П', 'п', 'Р', 'р', 'С', 'с', 'Т', 'т', 'Ф', 'ф', 'Х', 'х', 'Ц', 'ц', 
        'Ч', 'ч', 'Ш', 'ш', 'Щ', 'щ');
    static private $specialСharacters = array('ь', 'Ь', 'ъ', 'Ъ');
    
    // Гласыная буква
    private static function isPunctuationMark($letter) {return in_array($letter,self::$punctuationMark);}
    // Гласыная буква
    private static function isVowels($letter) {return in_array($letter,self::$vowels);}
    // Согласная буква
    private static function isConsonants($letter) {return in_array($letter,self::$consonants);}
    // специальная буква
    private static function isSpecialСharacters($letter) {return in_array($letter,self::$specialСharacters);}
    // маска буквы
    private static function letterMask($letter) {
        if(self::isVowels($letter)) {return 1;}
        if(self::isConsonants($letter)) {return 2;}
        if(self::isSpecialСharacters($letter)) {return 3;}
        if(self::isPunctuationMark($letter)) {return 4;}
        return 0;
    }
    
    private static function getPunctuationMark($text) {
        $textMark = '';
        $lenText = mb_strlen($text);
        foreach (self::$punctuationMark as $mark) {
            $lenMark = mb_strlen($mark);
            $len = $lenText - $lenMark;
            $checkText = mb_substr($text, $len);
            if( $checkText === $mark && mb_strlen($checkText) > mb_strlen($textMark) ) {
                $textMark = $checkText;
            }
        }
        return $textMark;
    }
    
    private static function getReleasingCharacters_first($text) {
        $char = '';
        foreach (self::$releasingCharacters as $mark) {
            $lenMark = mb_strlen($mark);
            $checkText = mb_substr($text, 0, $lenMark);
            if( $checkText === $mark && mb_strlen($checkText) > mb_strlen($char) ) {
                $char = $checkText;
            }
        }
        return $char;
    }
    private static function getReleasingCharacters_last($text) {
        $char = '';
        $lenText = mb_strlen($text);
        foreach (self::$releasingCharacters as $mark) {
            $lenMark = mb_strlen($mark);
            $len = $lenText - $lenMark;
            $checkText = mb_substr($text, $len);
            if( $checkText === $mark && mb_strlen($checkText) > mb_strlen($char) ) {
                $char = $checkText;
            }
        }
        return $char;
    }
    
    public static function shortenRusWord($word, $num = 2) {
        if($num < 1) {
            return $word;
        }
        $wordArray = array(); // массив символов слова
        $wa_key = 0; // ключ в массиве слов
        $sw_counter = 0; //количество символов в новом слове
        $vowels_counter = 0; // количество гласных
        foreach (preg_split('//u',$word,-1,PREG_SPLIT_NO_EMPTY) as $letter) {
            $wordArray[$wa_key]['mask'] = self::letterMask($letter);
            $wordArray[$wa_key++]['letter'] = $letter;
        }
        foreach ($wordArray as $key => $letter) {
            $sw_counter++;
            if($letter['mask'] === 1) {
                $vowels_counter++;
            }
            if($vowels_counter === $num) {
                if(
                        ( $letter['mask'] === 1 ) ||
                        ( $letter['mask'] === 4 ) ||
                        ( $letter['mask'] === 0 ) ||
                        ( $letter['mask'] === 2 && ( isset($wordArray[$key-1]['mask']) && ( $wordArray[$key-1]['mask'] === 2 || $wordArray[$key-1]['mask'] === 3 ) ) ) ||
                        ( $letter['mask'] === 2 && ( isset($wordArray[$key+1]['mask']) && $wordArray[$key+1]['mask'] === 1 ) ) ||
                        ( $letter['mask'] === 3 && ( isset($wordArray[$key-1]['mask']) && ( $wordArray[$key-1]['mask'] === 2 || $wordArray[$key-1]['mask'] === 3 ) ) ) ||
                        ( $letter['mask'] === 3 && ( isset($wordArray[$key+1]['mask']) && $wordArray[$key+1]['mask'] === 1 ) )
                ) {
                    break;
                }
            }
        }
        if(mb_strlen($word) > $sw_counter) {
            return mb_substr($word, 0, $sw_counter).".";
        } else {
            return $word;
        }
    }
    
    public static function shortenRusWordForLen($word, $minLen = 3, $maxLen = 6) {
        $wordLen = mb_strlen($word);
        if(!is_int($minLen) || !is_int($maxLen) || $minLen < 0 || $maxLen < 0 || $maxLen < $minLen || $minLen >= $wordLen) {
            return $word;
        }
        if($maxLen > $wordLen) {
            $maxLen = $wordLen;
        }
        $num = 0;
        $newWord = '';
        $newWordLen = mb_strlen($newWord);
        while($newWordLen <= $minLen && $newWordLen < $wordLen) {
            $num++;
            $newWord = self::shortenRusWord($word, $num);
            $newWordLen = mb_strlen($newWord);
            if(mb_substr($newWordLen, mb_strlen($newWordLen)) === '.') {
                $newWordLen--;
            }
        }
        if($newWordLen > $maxLen) {
            return self::shortenRusWord($word, $num - 1);
        } else {
            return $newWord;
        }
    }
    
    private static function shortenRusTextGeneral($text, $maxLength, $syllable = NULL, $minWordLen = NULL, $maxWordLen = NULL) {
        $newText = '';
        if(mb_strlen($text) > $maxLength) {
            $tempArray = explode(" ", trim($text));
            foreach ($tempArray as $word) {
                $firstChar = self::getReleasingCharacters_first($word);
                $lastChar = self::getReleasingCharacters_last($word);
                $word = str_replace(self::$releasingCharacters, "", $word);
                $textMark = self::getPunctuationMark($word);
                if($syllable !== NULL) {
                    $textWord = self::shortenRusWord($word, $syllable);
                } else if($minWordLen !== NULL && $maxWordLen !== NULL) {
                    $textWord = self::shortenRusWordForLen($word, $minWordLen, $maxWordLen);
                } else {
                    $textWord = $word;
                }
                $newText .=$firstChar.$textWord.$textMark.$lastChar.' ';
            }
            return "<span title='".$text."'>".trim($newText)."</span>";
        } else {
            return $text;
        }
    }
    
    public static function shortenRusText($text, $maxLength, $syllable = 2) {
        return self::shortenRusTextGeneral($text, $maxLength, $syllable, NULL, NULL);
    }
    
    public static function shortenRusTextForLen($text, $maxLength, $minWordLen = 3, $maxWordLen = 6) {
        return self::shortenRusTextGeneral($text, $maxLength, NULL, $minWordLen, $maxWordLen);
    }
}

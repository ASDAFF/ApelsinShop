<?php 
class PDFcreator extends TCPDF {
    
    private $orderID;
    private $data;
    private $total;
    private $image;

    public function __construct($orderID, $data, $total, $image, $orientation = 'P', $unit = 'mm', $format = 'A4', $unicode = true, $encoding = 'UTF-8', $diskcache = false, $pdfa = false) {
        parent::__construct($orientation, $unit, $format, $unicode, $encoding, $diskcache, $pdfa);
        $this->orderID = $orderID;
        $this->data = $data;
        $this->total = $total;
        $this->image = $image;
    }

    // Header page
    public function Header() {
        $styleB = array(
            'position' => '',
            'align' => 'C',
            'stretch' => false,
            'fitwidth' => true,
            'cellfitalign' => '',
            'border' => false,
            'hpadding' => 'auto',
            'vpadding' => 'auto',
            'fgcolor' => array(0,0,0),
            'bgcolor' => false, //array(255,255,255),
            'text' => true,
            'font' => 'helvetica',
            'fontsize' => 8,
            'stretchtext' => 1
        );
        $this->Image($this->image, 10, 3, 35, '', 'JPG', '', 'LTR', false, 0, '', false, false, 0, false, false, false);
        $this->SetFont('arialuni', '', 9);
        $this->write1DBarcode($this->orderID, 'C39', 63, 2, 140, 15, 1, $styleB, 'N');
        $this->SetTextColor(50);
        $this->SetXY(170, 10);
        $this->Write( 9, 'www.shop.apelsin.ru', '', false, 'R');
        $style = (['width' => 0.25, 'cap' => 'butt', 'join' => 'miter', 'dash' => 0, 'color' => [239, 127, 26]]); 
        $this->Line(10, 18, 200, 18, $style);
        $this->Ln( 6 );
        $this->SetFontSize(8);
        $date = date("d.m.Y");
        $this->Write( 10, $date, '', false, 'R');
    }

    // Footer page
    public function Footer() {
        $this->SetY(-15);
        $this->SetFont('arialuni', '', 8);
        $this->Cell(0, 10, $this->getAliasNumPage(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
    }
    
    public function generationPDF() {
        $this->SetMargins('10', '25', '10');
        $this->SetHeaderMargin(PDF_MARGIN_HEADER);
        $this->SetAutoPageBreak(TRUE, '15');
        $this->setImageScale(PDF_IMAGE_SCALE_RATIO);
        $this->SetDrawColor(50);
        $this->SetTextColor(50);
        $this->SetFillColor(205);
        $this->SetFont('arialuni', '', 14);
        $this->AddPage();
        $this->getHeaderTable();
        $this->getСellsTable();
    }
    
    // Header table
    private function getHeaderTable() {
        $this->SetFontSize(9);
        $this->Cell(10, 10, '№',  1, 0, 'C', true );
        $this->Cell(110, 10, 'Наименование',  1, 0, 'C', true );
        $this->Cell(20, 10, 'Количество',  1, 0, 'C', true );
        $this->Cell(20, 10, 'Цена',  1, 0, 'C', true );
        $this->Cell(30, 10, 'Сумма',  1, 0, 'C', true );
        $this->Ln( 10 );
    }
    
    // Сells table
    private function getСellsTable() {
        $row = 0;
        foreach ( $this->data as $dataRow ) {
            $number = $row + 1;
            $this->Cell(10, 10, $number , 1, 0, 'C');
            $this->MultiCell(110, 10, $dataRow['itemName'], 1, 'L', 0, 0, '', '', true, 0, false, false, 10, 'M');
                $this->Cell( 20, 10, $dataRow['amount'].' шт.', 1, 0, 'C');
                $this->Cell( 20, 10, $dataRow['priceValue'].' руб.', 1, 0, 'C');
                $this->Cell( 30, 10, $dataRow['allPriceValue'].' руб.', 1, 0, 'C');
            $row++;
            $this->Ln( 10 );
        }
        $this->Cell( 10, 10, $row + 1, 1, 0, 'C');
        $this->SetFontSize(12);
        $this->Cell( 150, 10, 'Итого: ', 1, 0, 'R');
        $this->SetFontSize(12);
        $this->Cell( 30, 10, $this->total.' руб.', 1, 0, 'C');
    }
}

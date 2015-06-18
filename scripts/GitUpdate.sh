#!/bin/bash
cd ..
echo "-----------------" >> ./scripts/GitUpdate.log
echo $(date +"%y-%m-%d %T")  >> ./scripts/GitUpdate.log
echo "-----------------" >> ./scripts/GitUpdate.log
git pull -v >> ./scripts/GitUpdate.log
echo "" >> ./scripts/GitUpdate.log

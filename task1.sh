#!/bin/bash

#Директории
dir1=$1
dir2=$2

#Функция синхронизации файлов
synchron(){
  #Просматриваем файлы первой директории
  for file_input in $(ls "$1")
  do
   check=0
   #Просматриваем файлы второй  директории
   for file_output in $(ls "$2")
   do
     #Файл первой директории нашли во второй
     if [ $file_input = $file_output ]
     then
       check=1
       
       last_usage_data=$(ls -l --time=ctime "$1"/"$file_input")
       echo "Файл $file_input из директории $1 последний раз редактировался $last_usage_data"
       last_usage_data=$(ls -l --time=ctime "$2"/"$file_output")
       echo "Файл $file_output из директории $2 последний раз редактировался $last_usage_data"
       
       echo "Вы хотите скопировать файл $file_input в папку $2 ? Ответьте yes или no"
       read choice
       
       case "$choice" in
         Yes | YES | yes ) cp "$1"/"$file_input" "$2";;
         No | NO | no) echo "Файл скопирован не был";;
       esac
       
       break;
     fi
   done
   #Файл первой директории не найден во второй
   if [ $check = 0 ]
   then
     cp "$1"/"$file_input" "$2"
   fi
  done      
}
  

synchron "$dir1" "$dir2"
synchron "$dir2" "$dir1"
  

exit 0



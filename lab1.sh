#!/bin/bash

#Директории
dir1=$1
dir2=$2
check=0

#Функция синхронизации файлов
synchron(){
  #Цикл директории, откуда будем брать файлы
  for file_input in $(ls "$1")
  do
   #Обнуление контролирующей переменной
   check=0
   #Цикл директории, куда будем копировать файл
   for file_output in $(ls "$2")
   do
     if [ $file_input = $file_output ]
     then
       check=1
       echo $check
       break;
     fi
   done
   #Если файла нет, то копируем его во вторую директорию
   if [ $check = 0 ]
   then
     cp "$1"/"$file_input" "$2"
   fi
  done
}

synchron "$dir1" "$dir2"
synchron "$dir2" "$dir1"
  

exit 0



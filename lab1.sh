#!/bin/bash

#Директории
dir1=$1
dir2=$2

#Функция синхронизации файлов
synchron(){
  #Цикл директории, откуда будем брать файлы
  for file in $(ls "$1")
  do
   #Копирование файла
   if find "$2" -name $file
   then
     cp "$1"/"$file" "$2"
   fi
  done
}

synchron "$dir1" "$dir2"
synchron "$dir2" "$dir1"
  

exit 0



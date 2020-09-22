#!/bin/bash

#Директории
dir1=$1
dir2=$2
check=0

#Функция синхронизации файлов
synchron() {
  #Цикл директории, откуда будем брать файлы
  for file_input in $(ls "$3")
  do
   #Обнуление контролирующей переменной
   check=0
   #Цикл директории, куда будем копировать файл
   for file_output in $(ls "$4")
   do
     if [ $file_input = $file_output ]
     then
       check=1
       echo $check
       break;
     fi
   done
   #Если файла нет, то копируем его во вторую директорию
   if [ $controler ]
   then
     cp "$3"/"$file_output" "$4"
   fi
  done

exit 0


for file in $(ls $("$dir1"))
do
  if [ -d "$file" ]
  then
    echo "$file is a directory"
  elif [ -f "$file" ]
  then
    echo "$file is a file"
  fi
  
  if [ find  $("$dir2" -name $file) ]
  then 
    cp $file "$dir2"
  fi
  
done 
exit 0

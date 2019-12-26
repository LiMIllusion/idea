#! /bin/bash
makeTemp="comp:\n\tgcc main.c\nx: comp\n\t./a.out"
cTemp='#include <stdio.h>\n\nint main(){\n\tprintf("Hello World");\n\treturn 0;\n}'

usage()
{
	echo -e "usage:\n[ -o | --open ] directoryName\tOpen in VS Code your previus created directory in home/dev/\n"
	echo -e "[ -n | --new ] directoryName\tCreate a new directory in /home/dev/ with some useful files and a little template\n"
	echo -e "[ -l | -- lang ]\tspecify your folder language for create the correct files. Currently supported languages: c\n"
}

dirName="" 
new=false
lang="plain"
if [[ "$1" == "" ]]; then 
  usage
  exit 1
fi
while [[ "$1" != "" ]]; do
	case "$1" in
		-o | --open) shift
				new=false
				dirName="$1"
				;;
		-n | --new) shift
			new=true
			dirName="$1"
			;;
		-l | --lang) shift
			lang=$1
			;;
		-h | --usage) usage
			;;
		 *) 	usage
       echo "nulla"
			exit 1
	esac
	shift
done

if [[ "$new" == true ]]
 then
	mkdir $HOME/Dev/$dirName
	touch $HOME/Dev/$dirName/$dirName.aedi
	case $lang in
		c)	echo -e $makeTemp > $HOME/Dev/$dirName/makefile;
			echo -e "$cTemp" > $HOME/Dev/$dirName/main.c;
			;;
	esac
		
fi
if [[ "$dirName" != "" ]]
 then
		code $HOME/Dev/$dirName
fi

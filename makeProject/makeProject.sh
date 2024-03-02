#!/bin/bash

#this script is used to create a new project from a template
#the script takes 3 arguments
#1. the template type
#2. the project name
#3. the directory to create the project in
#the script will then create a new project in the directory with the name of the project
# the templates are fully customizable and can be added to the Template directory


#----------------------------------------------------------------------------------------------------------------#
#From imput to variabele
template=$1

projectName=$2

directory=$3

workDir=$(pwd)


#----------------------------------------------------------------------------------------------------------------#
#Declareing

#get a list of templates
for file in $(ls ./Template/); do
    templateList+=("$file")
done

function help() {
	echo "makeProject.sh <template> <projectName> <directory>"
	echo "template: the type of project you want to create"
	echo "projectName: the name of the project"
	echo "directory: the directory you want to create the project in"
	echo "template list for a list a templates"
	echo "link to project: https://github.com/howeswarderbutcool/MakeCProject"
}

function error() {
	echo "an error occured, you need to enter the template type an optinal project name and directory"
	echo "use makeProject.sh help for more information"
}

function export() {
	if [ $template == "help" ]; then
		help
		return 0
	elif [ $template == "list" ]; then
		echo "template list: " ${templateList[@]}
		return 0
	else
		for dir in "${templateList[@]}"; do
			if [ $template == "$dir" ]; then
				echo "exporting: " $dir
				cp -r ./Template/$dir $directory/$dir
				mv $directory/$dir $directory/$projectName
				return 0
			fi
		done
	fi
}

#----------------------------------------------------------------------------------------------------------------#
#main() if you will
if [ $# -eq 0 ]; then
	error
else
	export
fi
#-------------------------------------------------END----------------------------------------------------------#

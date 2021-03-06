#!/bin/bash

#Copyright [2015] [Jason Clark]

#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at

    #http://www.apache.org/licenses/LICENSE-2.0

#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

VERSION=0.8.15
MODELDIR="src/model/"


function help()
{
    echo "Chicago Boss Model Generator by Jason Clark <mithereal@gmail.com>"
    echo " -n model name"
    echo " -p property1,property2,property3"
    echo " -d the projects base directory"
}

function create(){
	start
	echo "-module($NAME, [$PROPLIST])." > $BASEDIR$MODELDIR$FILENAME
    echo "-compile(export_all)." >> $BASEDIR$MODELDIR$FILENAME

}


function start()
{
    if [ -z "$BASEDIR" ]
then
  BASEDIR="./"

fi

if [ ! -d "$BASEDIR$MODELDIR" ]
	then
	echo "$BASEDIR is not a Chicagoboss Project" 
	exit
    fi

 if [ -z "$NAME" ]
then
echo "Enter the model name"
read NAME
FILENAME=${NAME}
FILENAME+=".erl"
fi

 if [ -z "$PROPLIST" ]
then
 echo "Enter the model properties"
read PROPLIST

fi

##FIXME add logic to make sure / is behind BASEDIR then we can remove / from start of MODELDIR
#if [[ "$BASEDIR" =~ '/'$ ]]; then 
  #BASEDIR=${BASEDIR};
  #else
  #BASEDIR+= "/"
#fi

}

while getopts ":?:p:n:d" opt; do
    case $opt in
    
		d)
		BASEDIR=$OPTARG
            ;;
		n)
		NAME=$OPTARG
            ;;
       -p)
        PROPLIST=$OPTARG
            ;;
        ?)
            help
exit 0
            ;;
    esac
done

create

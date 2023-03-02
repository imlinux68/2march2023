#!/bin/bash
function mkdirs () {
echo "1. makedirs"
cd ~
mkdir -p ~/aws/{DB/{RDS,DynamoDB},Deployment_model/{S3,Hybrid,RedShift,cloud}}

echo "2. go to Hybrid"
cd aws/Deployment_model/Hybrid

echo "3. move Hybrid to DB in relative"
mv ../Hybrid ../../DB/
tree ~/aws

echo "4. rename S3 to on-premise"
pwd
mv ../../Deployment_model/S3 ../../Deployment_model/on-premise
tree ~/aws

echo "5. copy DB to deployment model"
cp -r ~/aws/DB ~/aws/Deployment_model/
tree ~/aws

rm -rvf ~/aws
}


function cross () {
    read -p "enter a num for rows: " rows
    i=0
    h=1
    let vline=$rows/2
    while [[ $i -lt $vline ]]
        do
            for (( k=1; k<=$vline; k++ ))
                do 
                    echo -n " "
                done
        echo "*"
        let i=i+1
        done
    while [[ h -le $rows ]]
        do 
        echo -n "*"
        let h=h+1
        done
echo ""
    while [[ $i -ge 1 ]]
        do
            for (( k=1; k<=$vline; k++ ))
                do 
                    echo -n " "
                done
        echo "*"
        let i=i-1
        done
}

function decreasewhiletriangle(){
read -p "enter a num: " num
i=1

while [ $i -le $num ]
	do
		
		echo -n "* "
		
		j=$i
		while [ $j -lt $num ]
			do
				echo -n "* "
				let j=j+1
			done
		let i=i+1
	echo ""
	done
}




#!/bin/bash

print_func(){
    for i in "$@"
        do 
          echo "$i"
        done
}

​

#print_func $@



function extargslarge () {
num1=$1
num2=$2
num3=$3
i=1
numarray=("$num1" "$num2" "$num3")
    if [[ $# -lt 3 ]]
        then 
            echo "not enough enter at least 3"
    else echo "Great"
    fi
echo "The original array is:"
echo ${numarray[*]}

# bubble sort starts here
for ((i = 0; i<5; i++))
do

    for((j = 0; j<5-i-1; j++))
    do

        if [[ ${numarray[j]} -gt ${numarray[$((j+1))]} ]]
        then
            # sorting
            temp=${numarray[j]}
            numarray[$j]=${numarray[$((j+1))]}
            numarray[$((j+1))]=$temp
        fi
    done
done

echo "The sorted array is:"
echo ${numarray[*]} | cut -d ' ' -f 3

}

#extargslarge "$1" "$2" "$3"


function selection() {
OPT=("shutdown" "restart" "Quit")

select option in ${OPT[@]}
do
    case $option in
		"shutdown" ) shutdown -P now  ;;
		"restart" ) restart -r now ;;
		"Quit" ) exit 5 ;;
    esac
done
}

function location(){
read -p "Enter a directory name to list it " dir
ls $dir
}

function whatis(){
    read -p "Enter a file name: " file
    typeis=$( ls -l $file | awk '{print $1}' | cut -c 1 )
    if [[ $typeis == "l" ]]
        then 
            echo "its a link"
    elif [[ $typeis == "-" ]]
        then 
            echo "its a regula file"
    elif [[ -d "$file" ]]
        then 
            echo "its a dir"
    else echo "no such file"
    fi
}


function greate () {
read -p "Enter two numbers to find a biggeest: " num1 num2
if [[ $num1 -gt $num2 ]]
    then
        echo "$num1 is biggest"
    else
        echo "$num2 is biggest"
fi
}

function ugroup() {
read -p "Enter a file name to check: " fn
    ugroupis=$( ls -l $fn | awk '{print $3,$4}' )
    echo $ugroupis
}

while true
	do
		echo "********************"
		echo "MAKE YOUR CHOICE NOW"
		echo "********************"
		echo "1. run make dirs"
		echo "2. run cross script"
		echo "3. run triangle"
		echo "4. run extargs check"
		echo "5. run ext args largest"	
		echo "6. run select menu"
		echo "7. run location"
		echo "8. run what is script"
		echo "9. run greate function"
		echo "10. run ugroup func"	
		echo "11. exit"		
		read -p "Enter a num to check function: " c
    case $c in
		1) mkdirs  ;;
		2) cross ;;
		3) decreasewhiletriangle ;;
		4) extargs ;;
		5) extargslarge ;;
		6) selection ;;
		7) location ;;
		8) whatis ;;
		9) greate ;;
		10) ugroup ;;
		11) exit 5 ;;
		*) echo "1-7 ONLY!!!" ; sleep 3 ;;
    esac
	done






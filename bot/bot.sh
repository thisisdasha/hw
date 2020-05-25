echo Hi, `whoami`!
ctrl_c=0
trap 'ctrl_c=$(( $ctrl_c + 1 ))' SIGINT
while [ $ctrl_c -lt 3 ]
do
    read -p "What to do?" command
    if [[ "$command" =~ "find".* ]]
    then
        echo "Enter question:"
	read question
        echo https://www.google.com/search?q=`echo $question`
    fi
    if [[ "$command" =~ ^weather.* ]]
    then
        echo "Enter the city: "
	read city
        curl "http://wttr.in/$city"
    fi	
    if [[ "$command" =~ ^"time".* ]]
    then
        echo Now `date +%T`
    fi
done
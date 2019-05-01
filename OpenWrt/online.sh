# Small script to check if you are online

stty -F /dev/ttyACM0 9600 cs7 parenb parodd -cstopb clocal -crtscts -ixon -ixoff

sleep 2
echo -e 2 > /dev/ttyACM0


while true
do
  ping -c1 -w1 google.com

  if [ $? -eq 0 ]
  then
    echo "Ping OK"
    echo -e 1 > /dev/ttyACM0
  else
    echo "Ping fail"
    echo -e 2 > /dev/ttyACM0

  fi

  sleep 2

done

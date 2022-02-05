#!/bin/bash

# https://unix.stackexchange.com/questions/162133/run-script-in-a-screen
if [ -z "$STY" ]; then exec screen -dm -S OctoPrint /bin/bash "$0"; fi

  source OctoPrint/bin/activate
  ./OctoPrint/bin/octoprint serve
  
  

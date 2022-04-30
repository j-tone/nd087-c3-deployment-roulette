#!/bin/bash

function manual_verification {
  read -p "Continue deployment? (y/n) " answer

    if [[ $answer =~ ^[Yy]$ ]] ;
    then
        echo "continuing deployment"
    else
        exit
    fi
}

while [ $(kubectl get pods -n udacity | grep -c blue) -gt 0 ]
do
  kubectl apply -f green.yml
  manual_verification
  kubectl delete -f blue.yml
done
echo "Blue-green deployment successful!"

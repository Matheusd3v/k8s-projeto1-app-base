# !/bin/bash

echo "Creating volumes... "

kubectl apply -f ./k8s/volumes/pv.yml

echo "Persitent volume created! ✅"

kubectl apply -f ./k8s/volumes/pvc.yml

echo "Persitent volume claim created! ✅"

echo "Creating deployments..."

kubectl apply -f ./k8s/deployments/database.deployment.yml

kubectl apply -f ./k8s/deployments/application.deployment.yml

echo "Deplyments created! ✅"

echo "Creating services..."

kubectl apply -f ./k8s/services/application-load-balancer.service.yml

kubectl apply -f ./k8s/services/database-connection.service.yml

echo "All tasks created ✅"

echo "Changing js.js file with new minikube url..."

output=$(minikube service php --url)

url=$(echo "$output" | sed 's/\//\\\//g') 

sed -i "8s#url:.*#url: '$output',#" ./frontend/js.js

echo "All infra and files already! now you can run application openning frontend/index.html file! 🚀"
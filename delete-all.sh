# !/bin/bash

echo "Deleting deployments..."

kubectl delete -f ./k8s/deployments/database.deployment.yml

kubectl delete -f ./k8s/deployments/application.deployment.yml

echo "Deleting services..."

kubectl delete -f ./k8s/services/application-load-balancer.service.yml

kubectl delete -f ./k8s/services/database-connection.service.yml

echo "Deleting volumes... "

kubectl delete -f ./k8s/volumes/pvc.yml

kubectl delete -f ./k8s/volumes/pv.yml

echo "All tasks deleted ✅"


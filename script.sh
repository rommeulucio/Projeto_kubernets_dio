#!/bin/bash

echo "Criando Imagens..."

docker build -t rommeulucio/projeto-backend:1.0 backend/.
docker build -t rommeulucio/projeto-database:1.0 database/.

echo "Realizando push das imagens..."

docker push rommeulucio/projeto-backend:1.0
docker push rommeulucio/projeto-database:1.0

echo "Criando servicos no cluster Kubernetes..."

kubectl apply -f ./services.yml

echo "Realizando Deployments..."

kubectl apply -f ./deployment.yml


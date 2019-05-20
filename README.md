# Install Cluster

# ACR auth

## Sub id
/subscriptions/944cd0e5-9299-4ced-b6e9-d268b6259538/resourceGroups/mug-rg-infra/providers/Microsoft.ContainerRegistry/registries/mugacr

## Create service principal
az ad sp create-for-rbac --name acr-service-principal-auth --role Reader --scopes /subscriptions/944cd0e5-9299-4ced-b6e9-d268b6259538/resourceGroups/mug-rg-infra/providers/Microsoft.ContainerRegistry/registries/mugacr --query password --output tsv 

8b38c1cf-62e6-4a8d-a771-7a7dfb229d7f

# Get the service principal client id.
az ad sp show --id http://acr-service-principal-auth --query appId --output tsv

bdeac16d-cf3f-4e17-ae15-7269cf5b94b3

## Create acr auth

kubectl create secret docker-registry acr-auth --docker-server mugacr.azurecr.io --docker-username bdeac16d-cf3f-4e17-ae15-7269cf5b94b3 --docker-password 8b38c1cf-62e6-4a8d-a771-7a7dfb229d7f --docker-email joani.couma@gmail.com

# Tiller 


kubectl.exe apply -f helm/cluster-role-admin.yml
kubectl.exe apply -f helm/tiller-service-account.yaml

helm init --service-account tiller

helm install stable/nginx-ingress \
    --namespace kube-system \
    --name mug-prd-controller \
    --set controller.scope.namespace=mug \
    --set controller.ingressClass=mug-prd-controller \
    -f helm/mug-ingress-controller.yml




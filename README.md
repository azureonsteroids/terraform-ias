
## Install acr-auth

```
kubectl create secret docker-registry acr-auth --docker-server mugacr.azurecr.io --docker-username f146bffc-4807-40f9-a207-80ee2c44d566 --docker-password 4fa290e3-f9d9-427b-baa2-f3cdc36dd67c --docker-email joani.couma@gmail.com
```

### Registry ID 
```
az acr show --name mugacr --query id --output tsv
```

/subscriptions/944cd0e5-9299-4ced-b6e9-d268b6259538/resourceGroups/mug-rg-infra/providers/Microsoft.ContainerRegistry/registries/mugacr

### Password
```
az ad sp create-for-rbac --name acr-service-principal --role Reader --scopes /subscriptions/944cd0e5-9299-4ced-b6e9-d268b6259538/resourceGroups/mug-rg-infra/providers/Microsoft.ContainerRegistry/registries/mugacr --query password --output tsv
```

4fa290e3-f9d9-427b-baa2-f3cdc36dd67c

### Client ID 

```
az ad sp show --id http://acr-service-principal --query appId --output tsv
```

f146bffc-4807-40f9-a207-80ee2c44d566

## Install Helm

k apply -f helm/cluster-role-admin.yml
k apply -f helm/tiller-service-account.yaml

helm repo update

helm init --service-account tiller
helm init --upgrade --service-account tiller (only if helm was already init)

## Install nginx 

```
helm install stable/nginx-ingress \
    --namespace kube-system \
    --name mug-nginx \
    --set controller.scope.namespace=mug \
    --set controller.ingressClass=mug-controller \
    -f helm/mug-ingress-controller.yml
```
docker run -p 8080:8080 -e APP_COLOR=red -d  mmumshad/simple-webapp-color
docker run -p 8080:8080 -e APP_COLOR=pink -d mmumshad/simple-webapp-color


# test health
sudo minikube status
sudo kubectl get nodes

# k8s pod
sudo kubectl apply -f pod.yml
sudo kubectl get po
sudo kubectl describe po simple-webapp-color
sudo kubectl port-forward simple-webapp-color 8080:8080 -p --address 0.0.0.0

sudo kubectl get replicaset -o wide
sudo kubectl get deploy

# disable swap
sudo swapoff -a

# imperativ mode
# pod
 sudo kubectl run --image=mmumshad/simple-webapp-color \
> --env="APP_COLOR=red" \
> --restart=Never \
> simple-web-app
pod/simple-web-app created

# deploy
sudo kubectl create deployment --image=nginx:1.18.0 nginx-deployment
sudo kubectl scale --replicas=3 deployment/nginx-deployment
sudo kubectl set image deployment/nginx-deployment nginx=nginx
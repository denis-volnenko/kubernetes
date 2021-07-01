# УСТАНОВКА KUBERNATES

## УСТАНОВКА НА UBUNTU

https://infoit.com.ua/linux/kak-ustanovit-kubernetes-na-ubuntu-20-04-lts/

## НАСТРОЙКА ХРАНИЛИЩ

https://serveradmin.ru/hranilishha-dannyh-persistent-volumes-v-kubernetes/

## DEPLOY FLANNEL

```
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml
```

## DEPLOY INGRESS CONTROLLER

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/service/networking/ingress-resource-backend.yaml
```

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.34.1/deploy/static/provider/baremetal/deploy.yaml
kubectl describe service -n ingress-nginx ingress-nginx-controller
```


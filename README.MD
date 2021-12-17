Kubernetes is not watching for a new version of the image. The image pull policy specifies how to acquire the image to run the container. Always means it will try to pull a new version each time it's starting a container. To see the update you'd need to delete the Pod (not the Deployment) - the newly created Pod will run the new image.

There is no direct way to have Kubernetes automatically update running containers with new images. This would be part of a continuous delivery system (perhaps using kubectl set image with the new sha256sum or an image tag - but not latest).

## APPLY CONFIG

```
kubectl apply -f  https://gitlab.com/volnenko/kuber/-/raw/main/time-server.yaml
```

## DELETE CONFIG
```
kubectl delete -f  https://gitlab.com/volnenko/kuber/-/raw/main/time-server.yaml
```

## SHOW PODS
```
kubectl get pods --all-namespaces
```

## SHOW PV

```
kubectl get pv
```

## SHOW PVC

```
kubectl get pvc
```

## SHOW PODS

```
kubectl get pods
```

## SHOW SERVICES
```
kubectl get services
kubectl get svc --all-namespaces
```

## SHOW NAMESPACES
```
kubectl get -n namespace services
```

## SHOW NODES

```
kubectl get nodes --show-labels
```

## SHOW INGRESS SERVICES

```
kubectl get svc -n ingress-nginx
```

## SHOW NODE METRIX

```
kubectl top node -n kube-system
```

## SHOW POD METRIX
```
kubectl top pod --sort-by memory
```

01. ПРИМЕНИТЬ DEPLOYMENT STATELESS TIMESERVER

```
kubectl apply -f  https://gitlab.com/volnenko/kuber/-/raw/main/example/01-time-server-deployment.yaml
```

02. ПРИМЕНИТЬ СОЗДАНИЕ ВНЕШНЕГО СЕРВИСА ДЛЯ ДОСТУПА К TIMESERVER

```
kubectl apply -f https://gitlab.com/volnenko/kuber/-/raw/main/example/02-time-server-service-external.yaml
```

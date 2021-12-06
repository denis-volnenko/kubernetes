01. ПРИМЕНИТЬ DEPLOYMENT STATELESS TIMESERVER
```
kubectl apply -f  https://gitlab.com/volnenko/kuber/-/raw/main/example/01-time-server-deployment.yaml
```

02. ПРИМЕНИТЬ СОЗДАНИЕ ВНЕШНЕГО СЕРВИСА ДЛЯ ДОСТУПА К TIMESERVER
```
kubectl apply -f https://gitlab.com/volnenko/kuber/-/raw/main/example/02-time-server-service-external.yaml
```
ПРОВЕРИТЬ ДОСТУПНОСТЬ TIMESERVER НА ВНЕШЕНЕМ IP (ПОРТ 80)

03. УДАЛИТЬ КОНФИГУРАЦИЮ ВНЕШНЕГО СЕРВИСА ДЛЯ ДОСТУПА К TIMESERVER
```
kubectl delete -f https://gitlab.com/volnenko/kuber/-/raw/main/example/02-time-server-service-external.yaml
```

04. ПРИМЕНИТЬ СОЗДАНИЕ ВНУТРЕННЕГО СЕРВИСА ДЛЯ ДОСТУПА К TIMESERVER
```
kubectl apply -f https://gitlab.com/volnenko/kuber/-/raw/main/example/03-time-server-service-internal.yaml
```

05. ПРИМЕНИТЬ СОЗДАНИЕ INGRESS CONTROLLER ВНУТРИ КЛАСТЕРА
```
kubectl apply -f https://gitlab.com/volnenko/kuber/-/raw/main/example/04-ingress-controller-external.yaml
```

06. ПРИМЕНИТЬ КОНФИГУРАЦИЮ INGRESS CONTROLLER ДЛЯ VHOST TIMESERVER
```
kubectl apply -f https://gitlab.com/volnenko/kuber/-/raw/main/example/05-time-server-ingress-virtual-host.yaml
```
ПРОЕРИТЬ ДОСТУПНОСТЬ TIMESERVER ПО URL: http://time.master.kubernetes.volnenko.ru

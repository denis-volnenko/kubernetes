# INSTALL MASTER

ОБНОВЛЕНИЕ ПАКЕТОВ

```
apt-get update && apt-get upgrade
```

УСТАНОВКА СИСТЕМНЫХ УТИЛИТ

```
apt-get install -y mc curl fail2ban apt-transport-https ntpdate
```

УСТАНОВКА ВРЕМЕННОЙ ЗОНЫ

```
timedatectl set-timezone Europe/Samara
```

УСТАНОВКА СИНХРОНИЗАЦИИ ВРЕМЕНИ

```
apt-get install -y ntp
```

УСТАНОВКА НАЗВАНИЯ ХОСТА

```
hostnamectl set-hostname master.kubernates.volnenko.ru
```

РАЗОВОЕ ОТКЛЮЧЕНИЕ ФАЙЛА ПОДКАЧКИ
```
swapoff -a
```

ЗАГРУЗКА ДОПОЛНИТЕЛЬНЫХ МОДУЛЕЙ ЯДРА

```
echo "br_netfilter" > /etc/modules-load.d/k8s.conf
echo "overlay" >> /etc/modules-load.d/k8s.conf
```

ЗАГРУЗКА МОДУЛЕЙ ЯДРА 
```
modprobe overlay
modprobe br_netfilter
```

ПРОВЕРКА РАБОТЫ ДОПОЛНИТЕЛЬНЫХ МОДЕЛЕЙ ЯДРА
```
lsmod | egrep "br_netfilter|overlay"
```

СОЗДАНИЕ КОНФИГУРАЦИЮ ОБРАБОТКИ ТРАФИКА

```
echo "net.bridge.bridge-nf-call-ip6tables = 1" > /etc/sysctl.d/k8s.conf 
echo "net.bridge.bridge-nf-call-iptables = 1" >> /etc/sysctl.d/k8s.conf 
```

ПРИМЕНЕНИЕ КОНФИГУРАЦИИ

```
sysctl --system
```

УСТАНОВКА DOCKER

```
apt-get install -y docker docker.io
```

ДОБАВЛЕНИЕ DOCKER В АВТОЗАПУСК

```
systemctl enable docker
```

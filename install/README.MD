# INSTALL MASTER

ОБНОВЛЕНИЕ ПАКЕТОВ

```
apt-get update && apt-get upgrade
```

УСТАНОВКА СИСТЕМНЫХ УТИЛИТ

```
apt-get install -y mc curl fail2ban apt-transport-https ntpdate
```

УСТАНОВКА НАЗВАНИЯ ХОСТА

```
hostnamectl set-hostname master.kubernates.volnenko.ru
```

РАЗОВОЕ ОТКЛЮЧЕНИЕ ФАЙЛА ПОДКАЧКИ
```
swapoff -a
```

```
echo "br_netfilter" > /etc/modules-load.d/k8s.conf
echo "overlay" >> /etc/modules-load.d/k8s.conf
```

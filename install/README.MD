# 1. INSTALL MASTER

## 1.1. NETWORK

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

## 1.2. DOCKER

УСТАНОВКА DOCKER

```
apt-get install -y docker docker.io
```

ДОБАВЛЕНИЕ DOCKER В АВТОЗАПУСК

```
systemctl enable docker
```

НАСТРОЙКА CGROUPDRIVER ДЛЯ DOCKER

```
tee -a /etc/docker/daemon.json > /dev/null <<EOT
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2",
  "storage-opts": [
    "overlay2.override_kernel_check=true"
  ]
}
EOT
```

ПЕРЕЗАПУСК DOCKER 

```
systemctl restart docker
```

## 1.3. KUNERNATES

ДОБАВЛЕНИЕ КЛЮЧА ДЛЯ ЦИФРОВОЙ ПОДПИСИ РЕПОЗИТОРИЯ

```
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add
```

ДОБАВЛЕНИЕ РЕПОЗИТОРИЯ С КОМПОНЕНТАМИ KUBERNATES

```
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
```

УСТАНОВКА КОМПОНЕНТОВ KUBERNATES

```
apt-get install -y kubeadm kubelet kubectl kubernetes-cni
```

ЗАПРЕТ ОБНОВЛЕНИЯ КОМПОНЕНТОВ KUBERNATES
```
apt-mark hold kubelet kubeadm kubectl kubernetes-cni
```

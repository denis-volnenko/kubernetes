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

ПРОВЕРКА УСТАНОВКИ KUBERNATES

```
kubectl version --client
```

## 1.4. CLUSTER

ПРЕДВАРИТЕЛЬНАЯ ЗАГРУЗКА ОБРАЗОВ KUBERNATES
```
kubeadm config images pull
```

СОЗДАНИЕ КЛАСТЕРА KUBERNATES

```
kubeadm init --pod-network-cidr=10.244.0.0/16
```

КОМАНДА ПРИСОЕДИНЕНИЯ НОД WORKER

```
kubeadm join 65.108.149.85:6443 --token v513us.tjho0e9298cnhw96 \
	--discovery-token-ca-cert-hash sha256:80bb881e8ad2c58053ae4e777fad774ec3bde48ff850137a68bd38c23d694eca 
```

НАСТРОЙКА КОНФИГУРАЦИЙ KUBERNATES

```
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
```

РАЗВОРАЧИВАНИЕ КОМПОНЕНТОВ СЕТИ КЛАСТЕРА FLANNEL
```
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml
```

РАЗВОРАЧИВАНИЕ КОМПОНЕНТОВ INGRESS

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.0/deploy/static/provider/cloud/deploy.yaml
```

РАЗВОРАЧИВАНИЕ КОМПОНЕНТОВ DASHBOARD
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.5/aio/deploy/recommended.yaml
```

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yam
```

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml
```

УСТАНОВКА ARGO CD
```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

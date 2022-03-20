yum -y update
yum -y install epel-release
yum -y install libvirt qemu-kvm virt-install virt-top libguestfs-tools bridge-utils
yum install socat -y
yum install -y conntrack
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
usermod -aG docker centos
systemctl start docker
yum -y install wget
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube-linux-amd64
mv minikube-linux-amd64 /usr/bin/minikube
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl /usr/bin/
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables
#
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker 
#
systemctl enable docker.service
#
minikube delete
sudo swapoff -a
sudo -E minikube start --vm-driver=none
#
systemctl enable kubelet.service

#Pour l’autocomplétion:

echo 'source <(kubectl completion bash)' >> ${HOME}/.bashrc && source ${HOME}/.bashrc
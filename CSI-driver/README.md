# NFS + CSI Storage for On-Prem Kubernetes

Create two additional VMs for storage.

```bash
multipass launch --name nfs-1 --cpus 1 --memory 1G --disk 4G
multipass launch --name nfs-2 --cpus 1 --memory 1G --disk 4G
```

Go into the first disk
```bash
multipass shell nfs-1
```
and create DRBD disc
```bash
sudo apt update && sudo apt install -y drbd-utils

# simulate disc
sudo fallocate -l 1G /drbd-disk.img
sudo losetup /dev/loop10 /drbd-disk.img
```
and do the same thing for nfs-2

!!! I stopped here, because my vm was out od memory, then my machine was out of memory, then I got some errors and for the sake of the lab, I will continue with one vm without HA !!!

Again
```bash
multipass launch --name nfs-1 --cpus 1 --memory 1G --disk 5G
```
get into the vm
```bash
multipass shell nfs-1
```

then

```bash
sudo apt update
sudo apt install -y nfs-kernel-server
sudo mkdir -p /srv/nfs/kubedata
sudo chown nobody:nogroup /srv/nfs/kubedata
```


## CSI: nfs-subdir-external-provisioner

###  Installation
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/nfs-subdir-external-provisioner/master/deploy/rbac.yaml --namespace=default
```

Copy the file `nfs-deployment.yaml` and run

```bash
kubectl apply -f nfs-deployment.yaml
```

same for the storageclass and run

```bash
kubectl apply -f storageclass.yaml
```
and for the pvc

```bash
kubectl apply -f pvc.yaml
```

at the end for the pod (test-pod.yaml) as well

```bash
kubectl apply -f test-pod.yaml
```

now test it with

```bash
kubectl exec -it writer-pod -- cat /data/test.txt
```

Same issues again and not enough time, so unfortunately I had to give up on this part. I is not working for me, because no memory available, but it might work for you! Just do not use default namespace pls.
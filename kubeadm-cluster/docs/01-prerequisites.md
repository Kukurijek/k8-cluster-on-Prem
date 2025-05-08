# Prerequisites

* Apple Silicon System (M1/M2/M3 etc)
* 8GB RAM (16GB preferred).
    * All configurations - One control plane node will be provisioned - `controlplane`
    * If you have less than 16GB then only one worker node will be provisioned - `node01`
    * If you have 16GB or more then two workers will be provisioned - `node01` and `node02`

You'll need to install the following first.

* Multipass - https://multipass.run/install. Follow the instructions to install it and check it is working properly. You should be able to successfully create a test Ubuntu VM following their instructions. Delete the test VM when you're done.
* JQ - https://github.com/stedolan/jq/wiki/Installation#macos

Additionally

* Your account on your Mac must have admin privilege and be able to use `sudo`

## Virtual Machine Network

Due to how the virtualization works, the networking for each VM requires two network adapters; one used by Multipass and one used by everything else. Kubernetes components may by default bind to the Multipass adapter, which is *not* what I want, therefore I have pre-set an environment variable `PRIMARY_IP` on all VMs which is the IP address that Kubernetes components should be using.

`PRIMARY_IP` is defined as the IP address of the network interface on the node that is connected to the network having the default gateway, and is the interface that a node will use to talk to the other nodes and also to the internet. In bridge mode, this is also an address on your internal broadband network and is allocated by your broadband router.

### Bridge Networking

The default configuration in this lab is to bring the VMs up on bridged interfaces. What this means is that your Kubernetes nodes will appear as additional machines on your local network, their IP addresses being provided dynamically by your broadband router. This facilitates the use of your browser to connect to any NodePort services you deploy.


### NAT Networking

In NAT configuration, the network on which the VMs run is isolated from your broadband router's network by a NAT gateway managed by the hypervisor. This means that VMs can see out (and connect to Internet), but you can't see in (i.e. use browser to connect to NodePorts). It is currently not possible to set up port forwarding rules in Multipass to facilitate this.

The network used by the VMs is chosen by Multipass.


Input typed or pased to one command prompt will be echoed to the others. Remember to turn off broadcast when you have finished a section that applies to all nodes.

Next: [Compute Resources](02-compute-resources.md)

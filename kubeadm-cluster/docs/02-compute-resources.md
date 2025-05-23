# Compute Resources

Because I cannot use VirtualBox and am instead using Multipass, [a script is provided](../deploy-vms.sh) to create the three VMs.

1. Run the VM deploy script from your Mac terminal application

    ```bash
    ./deploy-vms.sh
    ```

2. Verify you can connect to all three (two if your Mac only has 8GB RAM) VMs:

    ```bash
    multipass shell controlplane
    ```

    You should see a command prompt like `ubuntu@controlplane:~$`

    Type the following to return to the Mac terminal

    ```bash
    exit
    ```

    Do this for `node01` and `node02` as well

If you encountered issues starting the VMs, you can try NAT mode. Note that in NAT mode you will not be able to connect to your NodePort services using your browser.

1. Run
    ```
    ./delete-vms.sh
    ```
1. Edit `deploy-vms.sh` and change `BUILD_MODE="BRIDGE"` to `BUILD_MODE="NAT"` at line 16.


# Deleting the Virtual Machines

When you have finished with your cluster and want to reclaim the resources, perform the following steps

1. Exit from all your VM sessions
1. Run the [delete script](../delete-vms.sh) from your Mac terminal application

    ```bash
    ./delete-vms.sh
    ````

1. Clean stale DHCP leases. Multipass does not do this automatically and if you do not do it yourself you will eventually run out of IP addresses on the multipass VM network.

    1. Edit the following

        ```bash
        sudo vi /var/db/dhcpd_leases
        ```

    1. Remove all blocks that look like this, specifically those with `name` set to `controlplane`, `node01`or `node02`
        ```text
        {
            name=controlplane
            ip_address=192.168.64.4
            hw_address=1,52:54:0:78:4d:ff
            identifier=1,52:54:0:78:4d:ff
            lease=0x65dc3134
        }
        ```

    1. Save the file and exit

Next: [Connectivity](./03-connectivity.md)<br>
Prev: [Prerequisites](./01-prerequisites.md)

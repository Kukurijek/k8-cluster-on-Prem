# Boot the worker nodes

Here I will join the worker nodes to the cluster. You will need the `kubeadm join` command from the previous step


## Join Workers

If you did not note down the join command on the cotrolplane node after running `kubeadm`, you can recover it by running the following on `controlplane`

```bash
kubeadm token create --print-join-command
```

On each of `node01` and `node02` do the following

1.  Become root (if you are not already)

    ```
    sudo -i
    ```

1.  Join the node

    > Paste the `kubeadm join` command output by `kubeadm init` on the control plane

### Verify

On `controlplane` run the following. After a few seconds both nodes should be ready

```
kubectl get nodes
```

Prev: [Boot controlplane](05-controlplane.md)


# Reflection & Troubleshooting

## Issues
- I wanted to create a clean solution that could be easily replicated, so I invested a lot of time into automating the setup.
- Overall, I spent too little time on the actual task itself.
- I lacked experience with Multipass and CSI in general.
- I also ran into memory limitations, both on the host machine and within the VMs.

## productive On-Premises environment
- There are definitely many things I would do differently — the list is long.
- I wouldn't rely so heavily on shell scripting, at least not to this extent.
- I wouldn’t always install the latest versions of tools or platforms (depending on the case), nor rely on default versions provided by platforms like Multipass — everything should be pinned.
- I would use Infrastructure as Code (IaC) for provisioning instead of doing it manually.
- I’d implement role-based access and guardrails to avoid doing everything directly — ideally via pipelines.
- I wouldn’t use the default namespace for any deployment.
- I wouldn’t use Multipass in a production environment.
- I would set up a highly available Kubernetes cluster from the start.
- I would introduce multiple stages in the setup process, if possible and if the budget allows for it.

## Tools & Logs

- I didn’t use many tools because the CNI was set up quickly and without issues — it took around 15 minutes, so there was no need for anything special.
- For the CSI part, I relied on Kubernetes logs and kubectl commands, which clearly indicated that the PVC, pod, etc. were stuck in a Pending state.
- While setting up the cluster, I used a lot of echo statements to print logs to the console, and in addition to that, I used the Multipass GUI to visually monitor what was happening.
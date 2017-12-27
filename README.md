# Towards Improved Provisioning and Utilization of Resources in Virtualized Environments

With widespread adoption of virtualization for hosting applications, 
service providers (like Amazon EC2 [1]) can facilitate better performance isolation, 
security, quicker deployment and elastic resource provisioning. Due to above benefits 
of virtualization, many hosting centers have transitioned from providing 
Hardware as a Service (HaaS) to Infrastructure as a Service (IaaS) instead. 
The primary difference between HaaS and IaaS is that the former involves use or 
leasing of physical hardware/machine whereas the latter involves leasing of virtual 
resources/machines. When multiple virtual machines (VMs) are placed on a single 
physical machine (PM), they compete for various resources like CPU, memory, network and 
disk I/O and interact in many conflicting ways. In any given virtualized environment, 
the physical resources available can be broadly categorized into, 
(i) Resources allocated to the virtual machines—virtual CPU, memory, disk and 
(ii) Resources in the virtualized host—host CPU and cache. 
In this thesis, we address two important issues related to the management of both 
these types of resources more efficiently, towards the overall goal of optimizing 
the performance of virtualized applications.

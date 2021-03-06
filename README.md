## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Diagram](Diagrams/Week_13_Assignment_NetworkDiagram_v3.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the [File Beat Playbook](/Ansible/filebeat_metricbeat-playbook.yml) file may be used to install only certain pieces of it, such as Filebeat.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and other files, as well as system metrics.


The configuration details of each machine may be found below:

| Name               | Function            | IP Address | Operating System |
|--------------------|---------------------|------------|------------------|
| JumpBoxProvisioner | Gateway/Provisioner | 10.1.0.4   | Linux            |
| Web-1              | DVWA Web Server     | 10.1.0.5   | Linux            |
| Web-2              | DVWA Web Server     | 10.1.0.6   | Linux            |
| Web-3              | DVWA Web Server     | 10.1.0.8   | Linux            |
| ElkStackVM         | Elk Stack           | 10.0.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBoxProvisioner machine can accept connections from the Internet. Access to this machine is only allowed from whitelisted IP addresses of your choosing.

Machines within the network can only be accessed by the JumpBoxProvisioner at IP Address 10.1.0.4.

A summary of the access policies in place can be found in the table below.

| Name               | Publicly Accessible? | Allowed IP Addresses                                                                      |
|--------------------|:--------------------:|-------------------------------------------------------------------------------------------|
| JumpBoxProvisioner | Yes                  | Internal: None<br>External: Any (w/appropriate SSH Key)                                   |
| Web-1              | No                   | Internal: 10.1.0.4<br>External: None                                                      |
| Web-2              | No                   | Internal: 10.1.0.4<br>External: None                                                      |
| Web-3              | No                   | Internal: 10.1.0.4<br>External: None                                                      |
| ElkStackVM         | Yes                  | Internal: 10.1.0.4, 10.1.0.5, 10.1.0.6, 10.1.0.8<br>External: Any (w/appropriate SSH Key) |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because once you have your playbook file written, you can effortlessly deploy repeatable and reliable machines.

The playbook implements the following tasks:
- Using APT module installs Docker.io
- Using APT module installs Python3-pip
- Using PIP module installs docker
- Using Command module increases virtual memory making this peristant
- Using Shell module increases virtual memory on restart
- Using Docker-Container module download and launch a docker ELK container
- Using Systemd module enables docker service on boot

The following screenshot displays the result of running `docker ps -a` after successfully configuring the ELK instance.

![Docker PS Output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.1.0.4
- 10.1.0.5
- 10.1.0.6
- 10.1.0.8

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects log files from systems to track system events such as access to files. 
- Metricbeat collects system statistics such as CPU and RAM usage which can be used to identify if activity on a system unexpectedly and for an extended time spikes which may indicate something malicious happening.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat_metricbeat-playbook.yml file to /etc/ansible/roles.
- Update the /etc/ansible/hosts file to include...
- Run the playbook, and navigate to *http://[your.ELKVM.publicIP]:5601/app/kibana* to check that the installation worked as expected.

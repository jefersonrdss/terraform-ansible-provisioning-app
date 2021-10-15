## Terraform and Ansible Provisioning Nodejs Application

### Sample Nodejs Application provisioned with terraform and ansible in a AWS and vSphere providers
<br>

Changes must be made according to each environment.

The idea of ​​this project is to show the framework with terraform and ansible to provision a simple Nodejs application in a virtual machine in vSphere provider or in an instance of AWS EC2.

---
### **TOOLS**
<br>
    
TERRAFORM
    
```sh
#
# inside terraform/provider directory
#
terraform init

terraform plan

terraform apply # yes
```
<br>

ANSIBLE

```sh
#
# inside ansible directory
#
ansible-playbook provisioning.yml -i hosts.yml
```
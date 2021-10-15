## Terraform and Ansible Provisioning Nodejs Application

### Sample Nodejs Application provisioned with terraform and ansible in a AWS and vSphere providers
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
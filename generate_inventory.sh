#!/bin/bash

# Get the IP from Terraform output
IP=$(terraform output -raw instance_public_ip)

# Generate Ansible inventory file
cat <<EOF > inventory.ini
[web]
$IP ansible_user=ec2-user ansible_ssh_private_key_file=EC2.pem
EOF

echo "✅ inventory.ini generated for Ansible:"
cat inventory.ini

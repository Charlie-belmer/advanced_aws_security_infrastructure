aws ec2-instance-connect send-ssh-public-key --instance-id i-07cec3c515bcb2e61 --availability-zone us-east-1b --instance-os-user ssm-user --ssh-public-key file://temp.pub
ssh -i temp -N -f -M -S temp-ssh.sock -L 3306:echodb-dev.cju92986bx4i.us-east-1.rds.amazonaws.com:5432 ssm-user@i-07cec3c515bcb2e61 -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" -o ProxyCommand="aws ssm start-session --target %h --document-name AWS-StartSSHSession --parameters portNumber=%p"
read -rsn1 -p "Press any key to close session."; echo
ssh -O exit -S temp-ssh.sock *
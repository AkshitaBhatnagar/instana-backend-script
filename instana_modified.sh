#!/bin/bash
echo "====================================================================================="
echo "Settig up base environment"
echo "====================================================================================="
apt update -y
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt update -y
apt-cache policy docker-ce
apt install docker-ce -y
systemctl start docker
systemctl enable docker

wget -qO - "https://self-hosted.instana.io/signing_key.gpg" | apt-key add -
echo "deb [arch=amd64] https://self-hosted.instana.io/apt generic main" > /etc/apt/sources.list.d/instana-product.list
apt-get update
apt-get install instana-console

mkdir -p /instana/log/instana /instana/data /instana/traces /instana/cert /instana/metrics
echo "====================================================================================="
echo "Instana Environment Settings"
echo "====================================================================================="

source ./config

if [ -n "$FLOATING_IP" -a -n "$AGENT_KEY" -a -n "$SALES_ID" ]
then
echo "Instana Host Provisioning"
        sed -i "s/HOSTNAME/${FLOATING_IP}/g" /instana/settings.hcl
        sed -i "s/AGENT_KEY/${AGENT_KEY}/g" /instana/settings.hcl
        sed -i "s/SALES_ID/${SALES_ID}/g" /instana/settings.hcl

        #chmod +x /instana/instana.sh
        #sh /instana/instana.sh
        openssl req -x509 -newkey rsa:2048 -keyout /instana/cert/tls.key -out /instana/cert/tls.crt -days 365 -nodes -subj "/CN=$FLOATING_IP"
        echo "Provisioning Instana Host"
		instana init -f /instana/settings.hcl -y --force > /instana/instana_init_output.txt
        tail -n 3 /instana/instana_init_output.txt > /instana/instana_credentials.txt
        echo "Instana License download"
		instana license download
        instana license import
        instana license verify
        echo 'The crdentials to access Instana are as follows:'
        cat /instana/instana_credentials.txt
        echo 'The crdentials to access Instana are stored in the VM and available at /instana/instana_credentials.txt'

else
        echo "Conditions not met terminating"
fi

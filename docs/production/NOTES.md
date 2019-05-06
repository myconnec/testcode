# Notes on setting up a production EC2 instance

iptables

For routing TCP 80 to 3000

```bash
sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3000
sudo iptables-save > ~/iptables.conf
sudo iptables-restore < ~/iptables.conf
```

Production S3 bucket mount

```bash
cd ~/
echo "" >> ~/.passwd-s3fs
chmod 0600 ~/.passwd-s3fs
sudo apt-get install -y s3fs
cd ./ConnecHub

cp -rf ./public ./public_old
rm -rf ./public
mkdir ./public
chmod 0775 ./public
s3fs -d media-source-prd -o use_cache=/tmp -o multireq_max=5 -o passwd_file=/home/ubuntu/.passwd-s3fs /home/ubuntu/ConnecHub/public
cp -rf ./public_old/ ./public
```

Start the Rails server

```bash
cd ~/ConnecHub
rails server -d --binding 0.0.0.0
```

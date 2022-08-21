
### Login SSH to AWS EC2

Locate private key generated when the instance was created. A file \*.pem

```
chmod 400 private_key.pem
```
```
ssh -i "private_key.pem" root@<public-dns>
```
i.e.:
```
ssh -i "private_key.pem" root@ec2-18-102-49-110.eu-south-1.compute.amazonaws.com
```
```
ssh -i "private_key.pem" ec2-user@ec2-18-102-49-110.eu-south-1.compute.amazonaws.com
```

### Install docker on EC2

```
sudo yum update -y
sudo yum install docker -y
```
Add the ec2-user to the docker group so you can execute Docker commands without using sudo.
Need to logout and login again.
```
sudo usermod -a -G docker ec2-user
```
or
```
sudo usermod -a -G docker $USER
```

#### Start docker
```
sudo service docker start
```

### Fresh install

```
sudo yum update -y
sudo yum install git -y
mkdir ~/repos/
cd ~/repos/
```
#### Install config repo
```
git clone https://github.com/x71c9/config.git
```

Add to `.bash_profile`
```
# Add custom profile
if [ -f ~/repos/config/.bash_profile ]; then
	. ~/repos/config/.bash_profile
fi
```

#### Install VIM (Already installed on Amazon Linux)
```
mkdir ~/.vim/
mkdir ~/.vim/.vim_backups/
ln -s ~/repos/config/colors ~/.vim/colors
```
#### Install Vim Plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
```
vim
:PlugInstall
```
#### Installing NODE
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```
Check if the installation worked - (you might want to logout and login again)
```
command -v nvm
```
It should output `nvm`

Use NVM
```
nvm install 16
````
```
nvm use 16
```

#### Installing COC Autocomplte
```
ln -s ~/repo/config/coc-settings.json ~/.vim/coc-settings.json
vim
:CocInstall coc-tsserver coc-json coc-css
```

#### Installing jq
```
sudo yum install jq -y
```

#### Install fzf
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### Add new keypair

Generate a new keypair in EC2 > Network & Security > KeyPairs

Then extract the public key from the private key:

```
ssh-keygen -y -f <path_to_private_key>
```

Add the public key to remote `~/.ssh/authorized_keys`


### Installing Load Balancer HAProxy

https://devcoops.com/install-haproxy-on-amazon-linux-2/
https://www.haproxy.com/blog/haproxy-configuration-basics-load-balance-your-servers/

```
sudo yum update
sudo yum install haproxy
```

The configuration file can be found in:
```
sudo -e /etc/haproxy/haproxy.cfg
```
Restart the deamon
```
sudo systemctl restart haproxy
```

Example config:
```
frontend main
    bind 0.0.0.0:80
    bind 0.0.0.0:443 ssl crt /etc/ssl/x81da.com/x81da.com.pem
    redirect scheme https if !{ ssl_fc }
    use_backend node1 if { hdr(host) -m dom node1.x81da.com }
    use_backend node2 if { hdr(host) -m dom node2.x81da.com }
    use_backend node0 if { hdr(host) -i x81da.com }
    default_backend node1

backend node0
   server server1 127.0.0.1:7017

backend node1
   server server1 127.0.0.1:7001

backend node2
   server server2 127.0.0.1:7002
```

Testing Your HAProxy Configuration
https://www.haproxy.com/blog/testing-your-haproxy-configuration/

Check if file is valid
```
haproxy -f /etc/haproxy/haproxy.cfg -c
```

Commands:
```
sudo systemctl start haproxy
sudo systemctl restart haproxy
sudo systemctl reload haproxy
sudo systemctl stop haproxy
```

### Installing Certbot

https://aws.amazon.com/premiumsupport/knowledge-center/ec2-enable-epel/

```
sudo amazon-linux-extras install epel
sudo yum install certbot
```

#### Generate certificate

Run:
```
sudo certbot certonly --manual
```
Select 2 domain, one main one with wildcard `x81da.com *.x81da.com`.

Update the DNS and continue:

Concatenate files into one single PEM for HAProxy
```
mkdir -p /home/ec2-user/.certs/x81da.com/

sudo cat /etc/letsencrypt/live/x81da.com/fullchain.pem \
  /etc/letsencrypt/live/x81da.com/privkey.pem \
  > /home/ec2-user/.certs/x81da.com/cert.pem
```

#### Update HAProxy config

```
sudo -e /etc/haproxy/haproxy.cfg
```
```
frontend
	...
	bind 0.0.0.0:443 ssl crt /home/ec2-user/.certs/x81da.com/cert.pem
	...
```

https://certbot.eff.org/instructions?ws=other&os=centosrhel7
To generate a certificate with the server running see the article above.

https://serversforhackers.com/c/letsencrypt-with-haproxy

#### Renew certificate

https://eff-certbot.readthedocs.io/en/stable/using.html#id32
The following command force renew the certificate:
```
sudo certbot certonly --manual --preferred-challenges=http --manual-auth-hook ./authenticator.sh --manual-cleanup-hook ./cleanup.sh -d x81da.com -d *.x81da.com --force-renewal
```

#### Crontab certificate
```
touch ~/crontab.log
vim /etc/crontab
```
```
0 7 * * * sudo /home/ec2-user/repos/static-server/bin/renew_certificate.sh /home/ec2-user/repos/static-server/bin x81da.com >> /home/ec2-user/crontab.log
```




#### List certificate
```
sudo certbot certificates
```
#### Delete certificate
```
sudo certbot delete
```

---


**Stop the web server** and:
```
sudo systemctl stop haproxy
```
```
sudo certbot certonly --standalone
```
**Start the web server**:
```
sudo systemctl start haproxy
```


Concatenate files into one single PEM for HAProxy
```
mkdir -p /home/ec2-user/.certs/node1.x81da.com/

sudo cat /etc/letsencrypt/live/node1.x81da.com/fullchain.pem \
  /etc/letsencrypt/live/node1.x81da.com/privkey.pem \
  | sudo tee /home/ec2-user/.certs/node1.x81da.com/cert.pem

sudo cat /etc/letsencrypt/live/node1.x81da.com/fullchain.pem \
  /etc/letsencrypt/live/node1.x81da.com/privkey.pem \
  > /home/ec2-user/.certs/node1.x81da.com/cert.pem
```

Add new line in HAProxy config file
```
sudoedit /etc/haproxy/haproxy.cfg
```




RENEW
https://serversforhackers.com/c/letsencrypt-with-haproxy












NOT WORKING

#### Installing Snap (Linux App Store)
https://snapcraft.io/docs/installing-snap-on-centos

Install snapd NOT WORKING ...................................
```
sudo yum install snapd
sudo yum install snapd-2.47.1-1.amzn2.1
```

Once installed, the systemd unit that manages the main snap communication socket needs to be enabled:
```
sudo systemctl enable --now snapd.socket
```

To enable classic snap support, enter the following to create a symbolic link between /var/lib/snapd/snap and /snap:
```
sudo ln -s /var/lib/snapd/snap /snap
```


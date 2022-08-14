
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

### Start docker
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
Install config repo
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

Install VIM (Already installed on Amazon Linux)
```
mkdir ~/.vim_backups/
mkdir ~/.vim/
ln -s ~/repos/config/colors ~/.vim/colors
```
Install Vim Plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
```
vim
:PlugInstall
```
Installing NODE
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

Installing COC Autocomplte
```
ln -s ~/repo/config/coc-settings.json ~/.vim/coc-settings.json
vim
:CocInstall coc-tsserver coc-json coc-css
```

Installing jq
```
sudo yum install jq -y
```


### Add new keypair

Generate a new keypair in EC2 > Network & Security > KeyPairs

Then extract the public key from the private key:

```
ssh-keygen -y -f <path_to_private_key>
```

Add the public key to remote `~/.ssh/authorized_keys`



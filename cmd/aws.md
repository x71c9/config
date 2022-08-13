
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
git clone https://github.com/x71c9/config.git
```

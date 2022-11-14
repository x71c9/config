https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

### Generating a new SSH key

```
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Note: If you are using a legacy system that doesn't support the Ed25519 algorithm, use:
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

### Use ssh key only for certain domain

~/.ssh/config

```
Host domain.com
	HostName git.domain.com
	User git
	IdentityFile ~/.ssh/new_key
	IdentitiesOnly yes
```

### Generic SSH key in `config`

~/.ssh/config

```
Host *
	AddKeysToAgent yes
	UseKeychain yes
	IdentityFile ~/.ssh/id_rsa
```

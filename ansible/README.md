create user with sudo access, set up authorized keys
``` bash
ansible-playbook -i '<hostname>,' -e user=friedm -e password_hash=`mkpasswd -m sha-512` create_user.yml 
```

set up dotfiles and install packages
``` bash
ansible-playbook -i '<hostname>,' --user friedm --ask-become-pass dotfiles.yml
--tags dotfiles,packages
```

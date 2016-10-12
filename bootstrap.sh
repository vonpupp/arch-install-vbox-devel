ssh-keygen -R "[localhost]:2222"
ssh-copy-id root@localhost -p 2222
ssh root@localhost -p 2222 'bash -s' < bootstrap-guest.sh
ssh root@localhost -p 2222

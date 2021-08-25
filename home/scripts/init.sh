echo "SSH"
sudo /etc/init.d/ssh start
cat /home/coder/.ssh/id_rsa.pub>>/home/coder/.ssh/authorized_keys

echo "Docker"
sudo /etc/init.d/docker start

echo "working directory:"
pwd

node /home/coder/scripts/repos.js

rm -fr /home/coder/scripts

/usr/bin/entrypoint.sh --bind-addr 0.0.0.0:8080 --auth password .
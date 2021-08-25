FROM codercom/code-server:latest

USER 1000

ENV USER=coder

RUN /usr/bin/entrypoint.sh --install-extension gioboa.jira-plugin && sudo apt-get update && sudo apt-get install openssh-server -y

# install nodejs
RUN curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n && sudo bash n lts && sudo npm i -g yarn

# install golang 这一步很耗时间，加层请加到后面去
RUN sudo apt install golang-go -y

# install Docker
RUN sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common gnupg2 \
  && sudo curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/debian/gpg | sudo apt-key add - \
  && sudo add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/debian $(lsb_release -cs) stable" \
  && sudo apt-get update \
  && sudo apt-get install -y docker-ce

ADD ./home/ /home/coder/

RUN sudo chown -R coder /home/coder 

ENTRYPOINT ["bash","/home/coder/scripts/init.sh"]

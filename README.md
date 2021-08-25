### Build 

> docker build -f Dockerfile -t cdr:latest .

### Usage

>  docker run --rm -p 8080:8080 -it -v ~/.ssh:/home/coder/.ssh -p 2022:22 -e PASSWORD="123456" -e EMAIL="your@email.cc" -e NAME="you_name" -e REPOS="you/repo1,you/repo2" --privileged cdr

- PASSWORD

  web IDE 访问密码
- EMAIL

  git用户邮箱
- NAME 

  git用户账号
- REPOS

  需要拉取的代码仓库列表

  ### Now

  访问 http://127.0.0.1:8080
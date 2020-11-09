# corretto-openjdk-ssh
add open ssh in amazon corretto-openjdk image for remotely ssh accessing

E.g
docker run -d \
   --name tstest \
   -p 10022:10022 \
   --env SSH_PUBLIC_KEY="ssh-rsa AAAAB3***" \
   amazoncorretto-openjdk-ssh:1

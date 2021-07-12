FROM python:3.7.11-slim
RUN apt-get update && apt-get install -y gnupg software-properties-common curl
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-get update && apt-get install terraform && apt-get update && apt-get install awscli -y
RUN echo "`aws configure set aws_access_key_id 'test'`"
RUN echo "`aws configure set aws_secret_access_key 'test'`"
FROM python:3.6
ARG SSH_PRIVATE_KEY
ENV PYTHONUNBUFFERED 1

# Pass the content of the private key into the container
RUN mkdir /root/.ssh/
RUN echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa

#Github requires a private key with strict permission settings
RUN chmod 600 /root/.ssh/id_rsa

#Add Github to known hosts
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts
RUN echo "deb http://security.ubuntu.com/ubuntu bionic-security main" >> /etc/apt/sources.list

RUN apt-get update && apt-get -y install supervisor python3-pip virtualenv default-libmysqlclient-dev libffi-dev python-dev libncurses5-dev libncursesw5-dev libpq-dev python3-mysqldb binutils libproj-dev gdal-bin proj-bin redis-server curl libxrender1 libfontconfig libxtst6 xz-utils libssl1.0-dev

RUN mkdir /babairon
WORKDIR /babairon
COPY requirements.txt /babairon
RUN  pip install -r requirements.txt

#REMOVE the ssh keys
RUN rm /root/.ssh/id_rsa

COPY . /babairon
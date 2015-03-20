FROM ubuntu:14.04.2

MAINTAINER miurahr

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install \
    openssh-server \
    supervisor \
    build-essential \
    curl \
    unzip \
    git-core \
    libxslt-dev \
    libxml2-dev \
    gcc \
    g++ \
    make && \
    curl -sL https://deb.nodesource.com/setup | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && rm -f /var/lib/apt/lists/* && \
    mkdir -p /root/.ssh /var/run/sshd && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config && \
    sed -ri 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config && \
    useradd -m -s /bin/bash hubot  && \
    echo 'hubot:hubot' | chpasswd && \
    echo 'hubot ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/hubot && \
    echo 'root:root' | chpasswd
# add supervisor config file
RUN mkdir -p /var/log/supervisor /etc/supervisor/conf.d /usr/local/bin
ADD supervisor/* /etc/supervisor/conf.d/
ADD runner.sh /usr/local/bin/runner.sh
RUN chmod +x /usr/local/bin/runner.sh && npm install -g mime@1.2.11 qs@0.4.2 coffee-script@1.6.3

ENV HOME /home/hubot
USER hubot
# install Hubot
WORKDIR /home/hubot
RUN wget https://github.com/github/hubot/archive/v2.6.0.zip && unzip v2.6.0.zip && mv hubot-2.6.0 hubot-root && rm v2.6.0.zip && \
    mkdir -p /home/hubot/hubot-root/hubot/bin
ADD hubot/* /home/hubot/hubot-root/hubot/

WORKDIR /home/hubot/hubot-root
RUN npm install && make package

# checkout hubot-lingr, hubot-trello
WORKDIR /home/hubot/hubot-root/hubot
RUN git clone https://github.com/miyagawa/hubot-lingr.git       node_modules/hubot-lingr   && \
    git clone https://github.com/hubot-scripts/hubot-trello.git node_modules/hubot-trello  && \
    npm install faye && npm install ntwitter

# expose ports
EXPOSE 22 80

# define default command
CMD /usr/local/bin/runner.sh

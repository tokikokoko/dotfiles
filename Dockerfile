FROM ubuntu:latest

ARG PASSWORD

RUN apt-get update && \
	apt-get install -y sudo git curl fish build-essential vim
RUN groupadd -r dot && \
  useradd -r -g dot dot && \
  echo "dot:$PASSWORD" | chpasswd && \
  echo 'dot  ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers && \
  mkdir /home/dot && \
  chown -R dot /home/dot
USER dot
COPY --chown=dot:dot ./ /home/dot/dotfiles/
WORKDIR /home/dot/dotfiles/

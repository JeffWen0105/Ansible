# FROM fedora:28

# LABEL maintainer="howhowwen <wen9077@gmail.com>"
# LABEL maintainer="website : https://jeffwen0105.com/"
# RUN dnf install -y vim  net-tools telnet sudo passwd  openssh-* python3-dev* curl wget bash-completion openssl git iproute
# RUN dnf install ansible -y && dnf clean all && rm -fr /var/cache 
# RUN ssh-keygen -A
# # RUN sed 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config > /etc/ssh/sshd_config
# RUN echo  redhat | passwd  --stdin root
# RUN useradd --create-home --shell /bin/bash  devops
# RUN echo  redhat | passwd  --stdin devops
# RUN echo 'devops ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
# RUN ssh-keygen -q  -N  "" -f ~/.ssh/id_rsa
# RUN cat ~/.ssh/id_rsa.pub >  ~/.ssh/authorized_keys
# RUN useradd --create-home --shell /bin/bash  student
# RUN echo  redhat | passwd  --stdin student
# RUN echo 'student ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
# USER devops
# RUN ssh-keygen -q  -N  "" -f ~/.ssh/id_rsa
# RUN cat ~/.ssh/id_rsa.pub >  ~/.ssh/authorized_keys
# USER student
# RUN ssh-keygen -q  -N  "" -f ~/.ssh/id_rsa
# RUN cat ~/.ssh/id_rsa.pub >  ~/.ssh/authorized_keys  && mkdir -p ~/playground
# RUN echo -e 'autocmd FileType yaml setlocal ai nu ts=2 sw=2 et\n:set cursorcolumn' > /home/student/.vimrc
# RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
# RUN sed -i s/font/bobby/g /home/student/.bashrc
# COPY src/example.tar.gz  /tmp/.
# # COPY src/labs.tar.gz /tmp/.
# RUN tar -C /home/student/playground/  -zxvf /tmp/example.tar.gz
# # RUN tar -C /home/student/playground/  -zxvf /tmp/labs.tar.gz
# USER root
# RUN echo -e  "Host * \n \tStrictHostKeyChecking no" >> /etc/ssh/ssh_config
# RUN cat /home/student/.ssh/id_rsa.pub >>  /home/devops/.ssh/authorized_keys && cat /home/devops/.ssh/id_rsa.pub >>  /home/student/.ssh/authorized_keys
# RUN chown -R student:student /home/student/ && chown -R devops:devops /home/devops
# RUN echo "alias ll='ls -la'" >> /etc/profile.d/ll.sh
# RUN rm -fr /etc/yum.repos.d/*
# WORKDIR /home/student/playground/example/
# EXPOSE 22

# # CMD ["/usr/sbin/sshd","-D"]

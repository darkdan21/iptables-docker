from ubuntu:16.04
RUN apt update -y && apt upgrade -y
RUN apt install iputils-ping -y && apt install iptables -y && apt install netcat-openbsd -y && apt install openssh-server -y && apt install iproute2 -y && apt install net-tools -y && apt install nmap -y && apt install sshpass -y && apt install ulogd -y
RUN echo "root:a" | chpasswd  && sed -i 's/prohibit-password/yes/g' /etc/ssh/sshd_config && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && echo "export VISIBLE=now" >> /etc/profile &&   echo "PermitEmptyPasswords yes" >> /etc/ssh/sshd_config && mkdir /var/run/sshd

COPY scripts/run.sh /
RUN chmod +x /run.sh
CMD /run.sh

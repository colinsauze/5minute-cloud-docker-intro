FROM nginx
MAINTAINER cos@aber.ac.uk


COPY startup.sh /

RUN apt update
RUN apt -y install procps
RUN chmod 777 /startup.sh

ENTRYPOINT ["bash","/startup.sh"]

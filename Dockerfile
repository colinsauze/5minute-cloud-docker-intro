FROM nginx
MAINTAINER cos@aber.ac.uk


COPY startup.sh /

RUN apt update
RUN apt -y install procps
RUN chmod 777 /startup.sh

#expose the web server port to outside the container
EXPOSE 80/tcp

ENTRYPOINT ["bash","/startup.sh"]

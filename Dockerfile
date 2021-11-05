FROM node:12-slim

RUN apt-get update
RUN apt-get install -y alien libaio1

WORKDIR /tmp
COPY client/oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm /tmp
RUN alien -i --scripts oracle-instantclient*.rpm
RUN rm -f oracle-instantclient*.rpm
RUN apt-get -y autoremove && apt-get -y clean
RUN rm -rf /tmp/oracle-instantclient*.rpm
ENV TZ=Asia/Bangkok
ENV LD_LIBRARY_PATH /usr/lib/oracle/11.2/client64/lib/
ENV ORACLE_HOME /usr/lib/oracle/11.2/client64/lib/

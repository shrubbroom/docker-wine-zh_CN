FROM ubuntu:focal
RUN echo "Asia/Shanghai" > /etc/timezone
RUN rm /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt update && apt upgrade -y
RUN apt install tzdata language-pack-zh-hans -y
RUN dpkg --add-architecture i386 && apt-get update && apt-get install wine32 wine winetricks -y
RUN apt clean
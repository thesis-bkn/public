#FROM python:3.11.5-slim
FROM pytorch/pytorch:2.1.2-cuda11.8-cudnn8-devel

WORKDIR /code/

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y \
        openssh-server \
        netcat-openbsd \
        pipx \
        build-essential \
        supervisor \
        ffmpeg libsm6 libxext6 \
    && mkdir /var/run/sshd \
    && echo 'root:password' | chpasswd \
    && sed -i 's/\#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

COPY requirements.txt /code/

RUN pip install -r requirements.txt

COPY build/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY data /code/

EXPOSE 22
EXPOSE 8888

CMD ["/usr/bin/supervisord"]

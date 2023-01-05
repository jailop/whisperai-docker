FROM debian:latest
LABEL mantainer="Jaime Lopez <jailop@fallible.dev>"
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 DEBIAN_FRONTEND="noninteractive"
COPY . .
RUN apt-get update && \
    apt-get install -y git ffmpeg dialog python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip --no-cache-dir install --upgrade \
        pip \
        setuptools-rust && \
    pip install -r requirements.txt && \
    pip install git+https://github.com/openai/whisper.git
CMD /bin/bash

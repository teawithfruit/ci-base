FROM docker:20.10.13-alpine3.15

RUN apk update && apk upgrade && apk add --no-cache curl jq python3 python3-dev build-base libffi-dev libressl-dev gettext git
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> $HOME/.profile
RUN . $HOME/.profile
RUN CRYPTOGRAPHY_DONT_BUILD_RUST=1
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py
RUN pip install cryptography
RUN pip install docker-compose
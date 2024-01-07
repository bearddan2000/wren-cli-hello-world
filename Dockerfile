FROM alpine:latest

WORKDIR /workspace

RUN apk update

RUN apk add clang git make

RUN git clone https://github.com/wren-lang/wren-cli wren

WORKDIR /workspace/wren/projects/make

RUN make 

RUN ln -s /workspace/wren/bin/wren_cli /sbin/wren

WORKDIR /code

COPY bin .

CMD "pwd"
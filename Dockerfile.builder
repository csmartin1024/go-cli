FROM golang@sha256:1a5f8b6db670a7776ce5beeb69054a7cf7047a5d83176d39b94665a54cfb9756 as builder
RUN apk update && apk add --no-cache git ca-certificates tzdata && update-ca-certificates
RUN adduser -D -g '' appuser
RUN mkdir /build 
ADD . /build/
WORKDIR /build 
ENV GO111MODULE=on
RUN go get -d -v
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags -w -s' -o main .
# RUN               GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/hello
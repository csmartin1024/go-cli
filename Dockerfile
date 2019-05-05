FROM scratch
COPY --from=go-builder:2.0 /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=go-builder:2.0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=go-builder:2.0 /etc/passwd /etc/passwd
COPY --from=go-builder:2.0 /build/main /app/
WORKDIR /app
USER appuser
CMD ["./main"]


# ############################
# # STEP 1 build executable binary
# ############################
# FROM golang:alpine AS builder
# # Install git.
# # Git is required for fetching the dependencies.
# RUN apk update && apk add --no-cache git
# WORKDIR $GOPATH/src/mypackage/myapp/
# COPY . .
# # Fetch dependencies.
# # Using go get.
# RUN go get -d -v
# # Build the binary.
# RUN go build -o /go/bin/hello
# RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/hello



# ############################
# # STEP 2 build a small image
# ############################
# FROM scratch
# # Copy our static executable.
# COPY --from=builder /go/bin/hello /go/bin/hello
# # Run the hello binary.
# # ENTRYPOINT ["/go/bin/hello"]
# CMD ["./main"]
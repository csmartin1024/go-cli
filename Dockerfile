FROM scratch
COPY --from=go-builder:latest /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=go-builder:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=go-builder:latest /etc/passwd /etc/passwd
COPY --from=go-builder:latest /build/main /app/
WORKDIR /app
USER appuser
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
CMD ["./main"]
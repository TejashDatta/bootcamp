FROM alpine
# secret with default location
RUN --mount=type=secret,id=secret1 cat /run/secrets/secret1

# secret secret location
RUN --mount=type=secret,id=secret2,dst=/custom_secret cat /custom_secret

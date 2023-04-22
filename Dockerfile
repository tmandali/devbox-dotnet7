FROM mcr.microsoft.com/dotnet/sdk:7.0-jammy 
# ubuntu:22.04

# hadolint ignore=DL3008
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y --no-install-recommends \
    # vscode requirements
    gnome-keyring wget curl python3-minimal ca-certificates \
    # development tools
    git build-essential \
    # clean up
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# install vscode-server
# hadolint ignore=DL4006
RUN wget -q -O- https://aka.ms/install-vscode-server/setup.sh | sh

# copy scripts
COPY src/* /usr/local/bin/

# entrypoint
ENTRYPOINT [ "serve-local" ]

# expose port
EXPOSE 8000


# FROM ubuntu:22.04

# RUN apt-get update && \
#     apt-get install -y git curl && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/* && \
#     curl -sL "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64" \
#         --output /tmp/vscode-cli.tar.gz && \
#     tar -xf /tmp/vscode-cli.tar.gz -C /usr/bin && \
#     rm /tmp/vscode-cli.tar.gz

# CMD [ "code", "tunnel", "--accept-server-license-terms" ]
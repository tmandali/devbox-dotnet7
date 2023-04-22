docker run --rm \
  --name vscode-server \
  --hostname vscode \
  --workdir /app \
  -p 8000:8000 \
  -e VSCODE_KEYRING_PASS="mysecretpassword" \
  -e VSCODE_SERVE_MODE=serve-local \
  -v ${PWD}:/root/.vscode-server \
  tmandali/devbox-dotnet7
#!/bin/sh
# Install (or reinstall) cortexctl, the Cortex org-server installer:
#
#   curl -fsSL https://raw.githubusercontent.com/go-cortex/cortex-releases/main/self-hosted/install.sh | sudo sh
#
# Reads the channel manifest (CORTEXCTL_CHANNEL, default stable), downloads
# the cortexctl it names for this CPU, checks it against the release's
# SHA256SUMS and installs it as /usr/local/bin/cortexctl. Published to
# go-cortex/cortex-releases by .github/workflows/publish-self-hosted.yml.
set -eu

channel="${CORTEXCTL_CHANNEL:-stable}"
base="https://raw.githubusercontent.com/go-cortex/cortex-releases/main/self-hosted"
dest="${CORTEXCTL_INSTALL_PATH:-/usr/local/bin/cortexctl}"

case "$(uname -s)-$(uname -m)" in
  Linux-x86_64 | Linux-amd64) arch=amd64 ;;
  Linux-aarch64 | Linux-arm64) arch=arm64 ;;
  *) echo "cortexctl supports Linux on x86_64 and arm64 only (this is $(uname -s) $(uname -m))." >&2; exit 1 ;;
esac
for tool in curl sha256sum; do
  command -v "$tool" >/dev/null 2>&1 || { echo "cortexctl install needs $tool." >&2; exit 1; }
done

manifest=$(curl -fsSL "$base/$channel.json")
amd64_url=$(printf '%s' "$manifest" | tr -d '\n\r\t ' | sed -n 's/.*"cortexctl":{[^}]*"url":"\([^"]*\)".*/\1/p')
case "$amd64_url" in
  https://github.com/go-cortex/cortex-releases/releases/download/cortexctl-v*/cortexctl-linux-amd64) ;;
  *) echo "The $channel manifest does not name a cortexctl download." >&2; exit 1 ;;
esac
asset="cortexctl-linux-$arch"
release_url="${amd64_url%/cortexctl-linux-amd64}"

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT INT TERM
echo "Downloading $release_url/$asset"
curl -fsSL -o "$tmp/$asset" "$release_url/$asset"
curl -fsSL -o "$tmp/SHA256SUMS" "$release_url/SHA256SUMS"
(cd "$tmp" && grep " $asset\$" SHA256SUMS | sha256sum -c -)
install -m 0755 "$tmp/$asset" "$dest"
echo "Installed $("$dest" version) at $dest. Next: sudo cortexctl setup"

#!/bin/bash
set -e

LILYPOND_VERSION=2.25.22
CHECKSUM="3e837e811aaa72323863925f0a4b5bd1aff1ed9b997e6c70dbe5c008e47872e7"

echo "Installing LilyPond version: ${LILYPOND_VERSION}"
lilypond_archive="lilypond-${LILYPOND_VERSION}-linux-x86_64.tar.gz"
base_url="https://gitlab.com/lilypond/lilypond/-/releases"
lilypond_url="${base_url}/v${LILYPOND_VERSION}/downloads/${lilypond_archive}"

wget -q --tries=3 --timeout=30 "${lilypond_url}"
if [ ! -f "${lilypond_archive}" ]; then
  echo "LilyPond archive not found!"
  exit 1
fi

echo "${CHECKSUM}  ${lilypond_archive}" > checksum.txt
sha256sum -c checksum.txt --status
rm checksum.txt

tar -xf "${lilypond_archive}"
echo "LilyPond installed successfully."

#!/usr/bin/env bash
# Publica a LP na branch `wp-build` sem depender do GitHub Actions.
# Faz o mesmo que .github/workflows/build-wp.yml: copia os arquivos públicos para a
# raiz de uma branch órfã e envia com --force. O plugin B2 LP Publisher (WordPress)
# lê dessa branch.
# Uso (na raiz do projeto, com a main já commitada e enviada): bash scripts/publicar-wp.sh
set -euo pipefail

raiz="$(git rev-parse --show-toplevel)"
cd "$raiz"

if [ -n "$(git status --porcelain)" ]; then
  echo "publicar-wp: há mudanças não commitadas; faça o commit antes de publicar." >&2
  exit 1
fi

sha="$(git rev-parse HEAD)"
remoto="$(git remote get-url origin)"
dist="$(mktemp -d)"
trap 'rm -rf "$dist"' EXIT

cp index.html robots.txt sitemap.xml "$dist/"
cp -r assets "$dist/"
test -f "$dist/index.html"

cd "$dist"
git init -q -b wp-build
git add -A
git commit -q -m "build: main@${sha::7}" -m "Origem: commit ${sha} (publicação manual, scripts/publicar-wp.sh)"
git push -q --force "$remoto" HEAD:wp-build
echo "publicar-wp: wp-build atualizada a partir de main@${sha::7}"

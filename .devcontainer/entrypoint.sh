#!/bin/sh

# package.json がなければ pnpm create create-next-app を実行
if [ ! -f "/workspace/app/package.json" ]; then
  echo "No package.json found, initializing Next.js project..."
  pnpm create next-app@latest app \
  --typescript \
  --tailwind \
  --biome \
  --app \
  --src-dir \
  --import-alias "@/*" \
  --turbopack \
  --react-compiler \
  --yes

  rm -rf /workspace/app/.gitignore
else
  echo "package.json found, skipping Next.js project initialization."
fi

cat .devcontainer/.zshrc >> ~/.zshrc
zsh && source ~/.zshrc

# # シェルを起動してコンテナが終了しないようにする
exec "$@"

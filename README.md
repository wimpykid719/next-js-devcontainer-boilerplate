# ⚡️ Next.js Boilerplate with Docker & Devcontainer

Ready-to-use **Next.js** development and production setup featuring:

- 🐳 **Multi-stage Docker build**: Zsh-powered dev environment + lightweight production image
- 📦 **pnpm** via Corepack
- 🖥️ **Zsh with autosuggestions & persistent history** for smooth CLI workflows
- 🛠 **Biome** as formatter & linter with Git integration for consistent commits
- 🎨 **Tailwind CSS** support with preinstalled VS Code extension
- 🔧 **Devcontainer configuration** for a reproducible and portable workspace


## 🚀 Getting Started

### 1. Clone this repository
```zsh
git clone https://github.com/your-username/nextjs-boilerplate.git
cd next-js-boilerplate
```

### 2. Create environment file
Before starting the container, copy the sample environment file:

```zsh
cp .devcontainer/.env.sample .devcontainer/.env
```
### 3. Open in Dev Container
Open the project in VS Code and run "Reopen in Container" to initialize the development environment.
All necessary tools (pnpm, Biome, Tailwind, etc.) are already preinstalled.

### 4. Run the Next.js app
Inside the container:


```zsh
cd app && pnpm dev
```

### 5. Biome Settings
Because our repository setup removes or ignores the .gitignore in app/, we must delete the corresponding configuration block in the default Next.js biome.json.

If this setting is not deleted, a ".gitignore not found" error occurs, causing formatting (likely) to fall back to the editor's extension settings instead of using Biome.
```
// delete this line
{
  "vcs": {
    "enabled": true,
    "clientKind": "git",
    "useIgnoreFile": true
  }
}
```

Now you can access the app at 👉 http://localhost:3000.

## 📂 Project Structure
```
.
├── .devcontainer/      # Devcontainer configs, Dockerfile & environment settings
│   ├── .env.sample
│   ├── .zshrc
│   ├── compose.yml
│   ├── devcontainer.json
│   ├── Dockerfile
│   └── entrypoint.sh
├── .gitignore          # Git ignore file
├── app/                # Next.js application source code
│   ├── public/         # Static assets
│   ├── src/            # Application source
│   ├── next.config.ts
│   └── package.json
├── LICENSE.md          # Project License
└── README.md
```
## ✅ Features
Consistent development environment with Docker & Dev Containers

Opinionated setup with Biome + TailwindCSS out-of-the-box

Zsh shell with history persistence for productivity

Production-ready build optimized for deployment

## 📜 License
MIT
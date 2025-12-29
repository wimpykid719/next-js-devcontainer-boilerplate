# ⚡️ Next.js Boilerplate with Docker & Devcontainer

Ready-to-use **Next.js** development and production setup featuring:

- 🐳 **Multi-stage Docker build**: Zsh-powered dev environment + lightweight production image
- 📦 **pnpm** via Corepack
- 🖥️ **Zsh with autosuggestions & persistent history** for smooth CLI workflows
- 🛠 **Biome** as formatter & linter with Git integration for consistent commits
- 🎨 **Tailwind CSS** support with preinstalled VS Code extension
- 🔧 **Devcontainer configuration** for a reproducible and portable workspace
- 🛡️ **Supply chain attack protection**: Version pinning, release age checks, and npm/npx usage restrictions


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

## 🛡️ Supply Chain Attack Protection

This boilerplate includes several security measures to protect against npm supply chain attacks:

### 1. pnpm Usage Enforcement
- npm/npx commands require confirmation before execution (use `USE_NPM_ANYWAY=1` to bypass)
- pnpm is enforced as the primary package manager via Corepack

### 2. Version Pinning
- `.npmrc` with `save-exact=true` ensures exact versions are saved
- `npm-package-json-lint` checks that all dependencies use exact versions (no `^` or `~`)
- Run `pnpm lint:package-json` to verify version pinning

### 3. Release Age Protection
- `pnpm-workspace.yaml` sets `minimumReleaseAge: 4320` (3 days) to prevent installing newly released packages
- `renovate.json` configures Renovate to wait 3 days before updating to new versions

### Configuration Files
The following security configuration files are automatically copied to `app/` during initialization:
- `.npmrc` - Version pinning configuration
- `.npmpackagejsonlintrc.json` - Linting rules for package.json
- `pnpm-workspace.yaml` - pnpm workspace settings with release age protection

Root-level configuration:
- `renovate.json` - Renovate bot configuration for dependency updates

## 📂 Project Structure
```
.
├── .devcontainer/      # Devcontainer configs, Dockerfile & environment settings
│   ├── .env.sample
│   ├── .zshrc
│   ├── app/            # Template files for Next.js app initialization
│   │   ├── .npmrc
│   │   ├── .npmpackagejsonlintrc.json
│   │   └── pnpm-workspace.yaml
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
├── README.md
└── renovate.json       # Renovate bot configuration
```
## ✅ Features
Consistent development environment with Docker & Dev Containers

Opinionated setup with Biome + TailwindCSS out-of-the-box

Zsh shell with history persistence for productivity

Production-ready build optimized for deployment

## 📜 License
MIT
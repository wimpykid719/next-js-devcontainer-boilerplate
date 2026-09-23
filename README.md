# ⚡️ Next.js Boilerplate with Docker & Devcontainer

Ready-to-use **Next.js** development and production setup featuring:

- 🐳 **Devcontainer**: Zsh-powered development image pinned to Node.js 24.21
- 📦 **pnpm** via Corepack
- 🖥️ **Zsh with autosuggestions**. Shell history lives in the container and resets when the container is removed
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

Now you can access the app at 👉 http://localhost:3000.

`pnpm dev` uses Next.js with Turbopack (port 3000). `pnpm dev:vinext` runs the same app on Vite for Cloudflare Workers (port 3001).


### 5. Deploy

The first container create installs both targets into `app/`. `next build` stays the Vercel build. vinext is added beside it and does not replace `pnpm dev`.

Set tokens in `.devcontainer/.env` before deploying from the container. Create a Cloudflare API token with the **Edit Cloudflare Workers** template.

```zsh
cd app
pnpm deploy:vercel
pnpm deploy:cf
```

`deploy:cf` runs the `deploy:vinext` script that `vinext init` adds. Wrangler’s local server uses port 8787.


### 6. Biome Settings
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

On first launch, Biome cannot reference the Biome installed in node_modules, causing an error. To resolve this, press Ctrl+Shift+P to open the command palette and execute the following command:

```
>Biome: Restart
```

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
│   ├── .npmrc
│   ├── .npmpackagejsonlintrc.json
│   ├── .zshrc
│   ├── pnpm-workspace.yaml
│   ├── .dockerignore
│   ├── compose.yml
│   ├── devcontainer.json
│   ├── Dockerfile
│   ├── entrypoint.sh
│   └── mcp.json        # Copied to ~/.cursor/mcp.json in the image
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

Zsh shell for the life of the container

Deploy the same Next.js app to Vercel or Cloudflare Workers

## 📜 License
MIT
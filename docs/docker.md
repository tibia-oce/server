# Multi-Stage Docker Build Pipeline

## Overview

This design implements a layered Docker build architecture to optimise build times and reduce publishing overhead. By splitting the previous monolithic build into three distinct layers, data-only changes can be deployed without recompiling the application, reducing build times from hours to minutes.

## Architecture

### Image Layers

1. **Base Layer (`Dockerfile.base`)**
   - System dependencies, vcpkg, and premake tools
   - Changes: When `vcpkg.json` is updated
   - Platforms: AMD64, ARM64

2. **Compiled Layer (`Dockerfile.compiled`)**
   - Application binary compilation
   - Changes: When source code in `src/` changes
   - Platforms: AMD64, ARM64

3. **Data Layer (`Dockerfile.datapack`)**
   - Runtime data files and configuration
   - Changes: When content in `data/` changes
   - Platforms: AMD64 only (for optimization)

### Workflow Behavior

- File change detection determines which layers to rebuild
- Each layer is only built when its dependencies change
- Data-only changes skip the ARM compile stage

## Usage

### Local Development

```bash
# Build all layers and run the stack
make compose

# Clean up docker resources
make clean

# Optional: build specific layers
make docker-base
make docker-compiled
make docker-datapack
```

### CI/CD Pipeline

The GitHub Actions workflow automatically:
- Detects changed files (vcpkg.json, src/, data/)
- Builds only affected layers
- Tags images appropriately:
  - `ghcr.io/{org}/{repo}-base:{tag}`
  - `ghcr.io/{org}/{repo}-compiled:{tag}-{platform}`
  - `ghcr.io/{org}/{repo}:{tag}`

## Implementation Details

- Build arguments enable local development without registry dependencies
- Default Dockerfile values reference local images
- CI/CD pipeline overrides these values to use registry images
- First-time builds are fully supported

## Directory Structure

```
/docker/                    # Docker build files
├── Dockerfile.base         # Base dependencies
├── Dockerfile.compiled     # Application binary
└── Dockerfile.datapack     # Runtime data
/.github/workflows/         # CI/CD configuration
/Makefile                   # Build automation
/docker-compose.yml         # Local development setup
```

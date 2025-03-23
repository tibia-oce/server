I have a GitHub Actions pipeline for my containerized application with the following characteristics:

Current State:
- A single monolithic Dockerfile with 4 stages: dependencies, premake, build, and final
- The workflow rebuilds the entire container for any change to src/ or data/ directories
- Building on ARM architecture takes over 2 hours
- Most changes are data-only updates that don't require recompilation
- Publishing a new container after data-only changes unnecessarily takes 2+ hours
- Container is published to my GitHub organization container registry

Proposed Future State:
- Split the Dockerfile into three separate files:
  1. Dockerfile.base: System dependencies, vcpkg, and premake tools
  2. Dockerfile.app: Compiles the application using the base image
  3. Dockerfile.data: Adds data files to the compiled application
- Implement a single intelligent GitHub Actions workflow that:
  - Detects which files changed (vcpkg.json, src/, or data/)
  - Only rebuilds the necessary images in the chain
  - For data-only changes, skips ARM compilation and only updates the data layer
  - Ensures proper dependencies between build stages
  - Maintains correct versioning and tagging across all images
- Publish to GitHub organization container registry with distinct image names:
  - server-base: The base dependencies image
  - server-compiled: The compiled application image
  - server: The final image with data (the one you actually deploy)

Important Implementation Requirements:
- Maintain the exact same formatting and indentation structure of the existing workflow YAML files
- Preserve all existing whitespace patterns and indentation
- Do not add any additional comments to the files
- Ensure changes blend seamlessly with the current file structure and style
- Place all new Dockerfiles within a new /docker directory in the repository
- Support local development by updating Makefile commands to allow building images from scratch without cache and in the correct order
- Do not hardcode image tags or references in the Dockerfiles (e.g., avoid using "FROM ghcr.io/your-org/server-base:latest")
- Instead, use build arguments to specify base images, allowing them to be overridden during local development when the images don't yet exist in the registry
- Provide a solution that works before any images exist in the registry (first-time builds)

This approach allows data-only updates to complete in minutes instead of hours while maintaining the full build chain when needed.

Please review this proposed architecture and suggest any improvements or potential issues.


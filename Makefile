# Makefile
.PHONY: compose clean-all server-only clean clean-dangling space-efficient-compose prune-all disk-status env buildx-build quick-debug debug-log-dump emergency-stop

.DEFAULT_GOAL := buildx-build

# Debug targets for handling high-volume logging
quick-debug:
	@echo "Starting server in debug mode..."
	@mkdir -p debug_logs
	@TIMESTAMP=$$(date +%Y%m%d-%H%M%S) && \
	LOG_FILE="debug_logs/server-$${TIMESTAMP}.log" && \
	HIGHLIGHT_FILE="debug_logs/server-$${TIMESTAMP}-highlights.log" && \
	echo "Log will be saved to $${LOG_FILE}" && \
	docker-compose up -d server && \
	echo "Collecting first 1000 lines of logs (5 second timeout)..." && \
	timeout 5s docker logs server -f | head -n 1000 > "$${LOG_FILE}" 2>&1 && \
	echo "Stopping server..." && \
	docker-compose stop server && \
	grep -i -E 'error|warn|exception|fatal|critical' "$${LOG_FILE}" > "$${HIGHLIGHT_FILE}" 2>/dev/null || echo "No errors found in logs" && \
	echo "--------------------------------------------" && \
	echo "Server stopped. First 1000 lines saved to: $${LOG_FILE}" && \
	echo "Potential errors extracted to: $${HIGHLIGHT_FILE}" && \
	echo "" && \
	echo "To view logs: less $${LOG_FILE}" && \
	echo "To view just errors: less $${HIGHLIGHT_FILE}" && \
	echo "--------------------------------------------"

# Get just the beginning of logs
debug-log-dump:
	@mkdir -p debug_logs
	@TIMESTAMP=$$(date +%Y%m%d-%H%M%S) && \
	LOG_FILE="debug_logs/server-$${TIMESTAMP}-start.log" && \
	echo "Getting first 200 lines of logs to $${LOG_FILE}..." && \
	docker logs server 2>&1 | head -n 200 > "$${LOG_FILE}" && \
	echo "Log saved. To view: less $${LOG_FILE}"

# Emergency stop server
emergency-stop:
	@echo "Emergency stopping server..."
	docker-compose stop server
	@echo "Server stopped."
	@echo "Current disk usage:"
	@df -h .

# Default target for minimal space usage
space-efficient-compose: env prune-all
	@echo "Building with minimal disk space usage..."
	$(MAKE) buildx-build

# Build with buildx for optimal space efficiency
buildx-build: env
	@echo "Building with Docker buildx for optimal space efficiency..."
	-docker buildx rm tibia-builder 2>/dev/null || true
	docker buildx create --use --name=tibia-builder --driver=docker-container
	docker buildx build --platform=$(shell uname -m | sed 's/x86_64/linux\/amd64/;s/aarch64/linux\/arm64/') \
		--output type=docker \
		--build-arg RELEASE_ARCH=$(shell uname -m | grep -q x86_64 && echo release_64 || echo release_arm64) \
		--file Dockerfile \
		--tag tibia-server:latest \
		--no-cache --rm .
	docker-compose up -d
	@echo "Removing build cache..."
	-docker buildx rm tibia-builder 2>/dev/null || true
	@echo "Server started."
	@echo "To follow logs (CAUTION - may grow quickly): docker logs server -f"
	@echo "To capture limited logs: make debug-log-dump"

# Original compose target (kept for compatibility)
compose: env
	docker-compose down
	docker-compose up --build -d server
	docker-compose up -d
	@echo "Server started."
	@echo "To follow logs (CAUTION - may grow quickly): docker logs server -f"
	@echo "To capture limited logs: make debug-log-dump"

# Build and restart only the server
server-only:
	docker-compose stop server
	docker-compose rm -f server
	docker-compose build server
	docker-compose up -d server
	@echo "Server started."
	@echo "To follow logs (CAUTION - may grow quickly): docker logs server -f"
	@echo "To capture limited logs: make debug-log-dump"

# Clean everything
clean:
	docker-compose down -v
	docker system prune -f
	docker volume prune -f

# More aggressive cleanup to free disk space
prune-all:
	@echo "Performing deep cleanup to free disk space..."
	docker-compose down --remove-orphans
	docker system prune -af --volumes
	docker builder prune -af

# Remove only dangling images
clean-dangling:
	@echo "Removing dangling images..."
	-docker rmi $(shell docker images -f "dangling=true" -q) 2>/dev/null || true

# Show current disk usage
disk-status:
	@echo "Docker disk usage:"
	@docker system df -v

# Check for .env file
env:
	@if [ ! -f .env ]; then echo "ERROR: .env file not found"; exit 1; fi
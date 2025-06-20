# Stage 1: OpenHands app
FROM ghcr.io/all-hands-ai/openhands:latest AS app

# Stage 2: Prepare runtime sandbox
FROM nikolaik/python-nodejs:python3.12-nodejs22 AS runtime

# Optional: install extra tools (e.g., git, gh, bash)
RUN apt-get update && apt-get install -y git bash

# Final Image: Combine app with runtime tooling
FROM app AS final

# Set default runtime image env
ENV SANDBOX_RUNTIME_CONTAINER_IMAGE=nikolaik/python-nodejs:python3.12-nodejs22

# Expose standard port
EXPOSE 3000

# Default command starts OpenHands in headless CLI mode
CMD ["python3", "-m", "openhands.cli"]

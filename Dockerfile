# Use the official Python 3.11 image from the Docker Hub
FROM python:3.11.4-slim-bullseye

# Update environment
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get upgrade --no-install-recommends -y \
	&& DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
	make \
	git \
	build-essential \
	gcc \
	g++ \
	libc6-dev \
	postgresql \
	libpq-dev \
	libssl-dev \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*


# Change the working directory
WORKDIR /code

# Copy the rest of the code
COPY . /code

# Install PDM
RUN pip install pdm

# Install pre-commit
RUN pip install pre-commit

# Use PDM to install dependencies
RUN pdm sync

# Default command to start bash
CMD ["/bin/bash"]

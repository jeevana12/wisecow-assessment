# Use Ubuntu as base image
FROM ubuntu:22.04

# Set working directory
WORKDIR /app

# Install necessary packages
RUN apt-get update && apt-get install -y  fortune-mod cowsay netcat \
    && ln -s /usr/games/cowsay /bin/cowsay \
    && ln -s /usr/games/fortune /bin/fortune \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy script into container
COPY wisecow.sh /app/wisecow.sh

# Give execution permissions
RUN chmod +x /app/wisecow.sh

# Expose required port
EXPOSE 4499

# Run the script
CMD ["/app/wisecow.sh"]

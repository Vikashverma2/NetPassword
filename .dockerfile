# Use the official Dart image as the base image
FROM dart:stable AS build

# Install Flutter dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa

# Clone the Flutter SDK from GitHub
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set the Flutter SDK path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Pre-download the Flutter dependencies
RUN flutter precache

# Enable Flutter web (if your project targets the web)
RUN flutter config --enable-web

# Set the working directory
WORKDIR /app

# Copy the project files to the container
COPY . .

# Get the Flutter dependencies
RUN flutter pub get

# Build the Flutter project (change to your target platform)
RUN flutter build web --release

# Use a web server to serve the Flutter app
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]

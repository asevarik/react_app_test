# Stage 1: Build the app
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package.json and lock file
COPY package.json pnpm-lock.yaml ./

# Install dependencies using pnpm
RUN npm install -g pnpm && pnpm install --frozen-lockfile

# Copy the rest of the project files
COPY . .

# Build the Vite app for production
RUN pnpm run build --mode prod

# Stage 2: Serve the app with nginx
FROM nginx:alpine

# Copy the built files from the previous stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose the default nginx port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]

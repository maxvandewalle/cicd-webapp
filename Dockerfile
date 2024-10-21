# Use Node.js 20.x.x (LTS) as the base image
FROM node:20.17.0-alpine

# Set the working directory in the container to /app
WORKDIR /app

# Copy the package.json and yarn.lock files to install dependencies first
COPY package.json yarn.lock ./

# Install the application dependencies using yarn with frozen lockfile
RUN yarn install --frozen-lockfile

# Copy the entire application code to the /app directory in the container
COPY . .

# Expose port 3000 to make the application accessible
EXPOSE 3000

# Start the application when the container starts
CMD ["yarn", "start"]

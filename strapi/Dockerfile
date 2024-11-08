FROM node:18-alpine

# Install dependencies for Sharp
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev

# Set up environment variables
ARG NODE_ENV=development
ARG HOST=0.0.0.0
ARG PORT=1337

# Secrets and Database (Use defaults, can be overridden by Docker Compose or other external sources)
ARG APP_KEYS=
ARG API_TOKEN_SALT=
ARG ADMIN_JWT_SECRET=
ARG TRANSFER_TOKEN_SALT=

ARG DATABASE_CLIENT=sqlite   # Defaults to sqlite; set to mysql if using MySQL
ARG DATABASE_HOST=localhost  # Defaults to localhost; set to strapiDB if using with docker compose
ARG DATABASE_PORT=3306
ARG DATABASE_NAME=strapi
ARG DATABASE_USERNAME=strapi
ARG DATABASE_PASSWORD=strapi
ARG DATABASE_FILENAME=.tmp/data.db

ARG IMPORT_DATA=
ARG JWT_SECRET=
ARG STRAPI_ADMIN_CLIENT_URL=http://localhost:3000
ARG STRAPI_ADMIN_CLIENT_PREVIEW_SECRET=

# Apply ARGs as ENV
ENV NODE_ENV=${NODE_ENV}

ENV HOST=${HOST}
ENV PORT=${PORT}

ENV APP_KEYS=${APP_KEYS}
ENV API_TOKEN_SALT=${API_TOKEN_SALT}
ENV ADMIN_JWT_SECRET=${ADMIN_JWT_SECRET}
ENV TRANSFER_TOKEN_SALT=${TRANSFER_TOKEN_SALT}

ENV DATABASE_CLIENT=${DATABASE_CLIENT}
ENV DATABASE_HOST=${DATABASE_HOST}
ENV DATABASE_PORT=${DATABASE_PORT}
ENV DATABASE_NAME=${DATABASE_NAME}
ENV DATABASE_USERNAME=${DATABASE_USERNAME}
ENV DATABASE_PASSWORD=${DATABASE_PASSWORD}
ENV DATABASE_FILENAME=${DATABASE_FILENAME}

ENV IMPORT_DATA=${IMPORT_DATA}
ENV JWT_SECRET=${JWT_SECRET}
ENV STRAPI_ADMIN_CLIENT_URL=${STRAPI_ADMIN_CLIENT_URL}
ENV STRAPI_ADMIN_CLIENT_PREVIEW_SECRET=${STRAPI_ADMIN_CLIENT_PREVIEW_SECRET}

# Set working directory and install dependencies
WORKDIR /opt
COPY package.json yarn.lock ./
COPY ./scripts ./scripts
RUN yarn config set network-timeout 600000 -g && yarn install

# Copy application files and set up Strapi
WORKDIR /opt/app
COPY . .
ENV PATH /opt/node_modules/.bin:$PATH
RUN chown -R node:node /opt/app

# Run additional yarn install for app context
USER node
RUN yarn

# Expose port for Strapi
EXPOSE 1337

# Copy and set permissions for entrypoint
COPY entrypoint.sh /opt/app/entrypoint.sh
USER root
RUN chmod +x /opt/app/entrypoint.sh
USER node

# Run entrypoint
CMD ["/opt/app/entrypoint.sh"]

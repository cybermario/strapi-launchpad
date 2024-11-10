FROM node:18-alpine

# Install dependencies for Sharp
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev

# Set up environment variables
ARG NODE_ENV=development

ARG WEBSITE_URL=http://localhost:3000 # Add the correct ENV var for this onto your hosting platform, point it to your production website.
ARG NEXT_PORT=3000

ARG NEXT_PUBLIC_API_URL=http://localhost:1337
ARG PREVIEW_SECRET=the-same-random-token-as-for-strapi

# Apply ARGs as ENV
ENV NODE_ENV=${NODE_ENV}

ENV WEBSITE_URL=${WEBSITE_URL}
ENV PORT=${NEXT_PORT}

ENV NEXT_PUBLIC_API_URL=${NEXT_PUBLIC_API_URL}
ENV PREVIEW_SECRET=${PREVIEW_SECRET}

# Set working directory and install dependencies
WORKDIR /opt
COPY package.json yarn.lock ./
RUN yarn config set network-timeout 600000 -g && yarn install

# Copy application files and set up Strapi
WORKDIR /opt/app
COPY . .
ENV PATH /opt/node_modules/.bin:$PATH
RUN chown -R node:node /opt/app

# Run additional yarn install for app context
USER node
RUN yarn

# Expose port for NEXT
EXPOSE 3000

# Copy and set permissions for entrypoint
COPY entrypoint.sh /opt/app/entrypoint.sh
USER root
RUN chmod +x /opt/app/entrypoint.sh
USER node

# Run entrypoint
CMD ["/opt/app/entrypoint.sh"]

# 🚀 Getting started with Strapi

Strapi comes with a full featured [Command Line Interface](https://docs.strapi.io/dev-docs/cli) (CLI) which lets you scaffold and manage your project in seconds.

### `develop`

Start your Strapi application with autoReload enabled. [Learn more](https://docs.strapi.io/dev-docs/cli#strapi-develop)

```
npm run develop
# or
yarn develop
```

### `start`

Start your Strapi application with autoReload disabled. [Learn more](https://docs.strapi.io/dev-docs/cli#strapi-start)

```
npm run start
# or
yarn start
```

### `build`

Build your admin panel. [Learn more](https://docs.strapi.io/dev-docs/cli#strapi-build)

```
npm run build
# or
yarn build
```

## ⚙️ Deployment

Strapi gives you many possible deployment options for your project including [Strapi Cloud](https://cloud.strapi.io). Browse the [deployment section of the documentation](https://docs.strapi.io/dev-docs/deployment) to find the best solution for your use case.

```
yarn strapi deploy
```

## 📚 Learn more

- [Resource center](https://strapi.io/resource-center) - Strapi resource center.
- [Strapi documentation](https://docs.strapi.io) - Official Strapi documentation.
- [Strapi tutorials](https://strapi.io/tutorials) - List of tutorials made by the core team and the community.
- [Strapi blog](https://strapi.io/blog) - Official Strapi blog containing articles made by the Strapi team and the community.
- [Changelog](https://strapi.io/changelog) - Find out about the Strapi product updates, new features and general improvements.

Feel free to check out the [Strapi GitHub repository](https://github.com/strapi/strapi). Your feedback and contributions are welcome!

## ✨ Community

- [Discord](https://discord.strapi.io) - Come chat with the Strapi community including the core team.
- [Forum](https://forum.strapi.io/) - Place to discuss, ask questions and find answers, show your Strapi project and get feedback or just talk with other Community members.
- [Awesome Strapi](https://github.com/strapi/awesome-strapi) - A curated list of awesome things related to Strapi.

## Commands
Available commands in your project:

Start Strapi in watch mode. (Changes in Strapi project files will trigger a server restart)
```
npm run develop
```

Start Strapi without watch mode.
```
npm run start
```

Build Strapi admin panel.
```
npm run build
```

Deploy Strapi project.
```
npm run deploy
```

Seed your database with sample data.
```
npm run seed:example
```

Display all available commands.
```
npm run strapi
```

To get started run
```
npm run develop
```

## Most used commands

Recommended for Strapi 5.3.0

```
nvm install 18
```

```
nvm use 18
```

```
yarn && yarn seed && yarn develop
```

The @strapi-community/dockerize package is a CLI tool that can be used to generate a Dockerfile and docker-compose.yml file for a Strapi project.

To get started run
```
npx @strapi-community/dockerize@latest
```
 within an existing Strapi project folder and follow the CLI prompts.

## Docker

Development build

```
docker build \
  --build-arg NODE_ENV=development \
  -t mystrapiapp:latest \
  .
```

Production build

```
docker build \
  --build-arg NODE_ENV=production \
  # --build-arg STRAPI_URL=https://api.example.com \ # Uncomment to set the Strapi Server URL
  -t mystrapiapp:latest \ # Replace with your image name
  -f Dockerfile.prod .
```

---

<sub>🤫 Psst! [Strapi is hiring](https://strapi.io/careers).</sub>

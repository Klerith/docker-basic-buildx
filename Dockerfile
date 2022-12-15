# Dependencias de desarrollo
FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16 as deps
WORKDIR /app
COPY package.json ./
RUN npm install


# Build y Tests
FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16 as builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run test

# Dependencias de Producción
FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16 as prod-deps
WORKDIR /app
COPY package.json ./
RUN npm install --prod

# Ejecutar la APP
FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16 as runner
WORKDIR /app
COPY --from=prod-deps /app/node_modules ./node_modules
COPY app.js ./
COPY tasks/ ./tasks
CMD [ "node", "app.js" ]


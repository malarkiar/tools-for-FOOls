# Stage 1: Build
FROM node:20.10 as builder

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Stage 2: Run
FROM node:20.10

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/dist ./dist
COPY package*.json ./

RUN npm install --only=production

EXPOSE 3000
CMD ["node", "dist/index.js"]

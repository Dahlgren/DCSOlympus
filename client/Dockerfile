FROM node:20-alpine AS appbuild

WORKDIR /usr/src/app
COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY . .
RUN npm run build-linux-release

FROM node:20-alpine
WORKDIR /usr/src/app
COPY package.json ./
COPY package-lock.json ./
RUN npm install --production
COPY . .
COPY --from=appbuild /usr/src/app/public ./public
EXPOSE 3000
CMD npm start

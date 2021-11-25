FROM mhart/alpine-node:14 as build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run build

# FROM mhart/alpine-node:slim-14 as runtime

# WORKDIR /app

# COPY --from=build /app .

# COPY . .

EXPOSE 3000

CMD ["node", "build"]

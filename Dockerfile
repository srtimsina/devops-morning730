FROM node:22.23.3-alpine AS build
LABEL com.techaxis.version="1.0.0"
WORKDIR /var/code

COPY package*.json ./
RUN npm install

FROM node:22.23.3-alpine AS runtime
LABEL com.techaxis.version="1.0.0"
WORKDIR /var/code

ENV NODE_ENV=production
ENV PORT=3000

COPY --from=build /var/code/node_modules ./node_modules
COPY . .

USER node
EXPOSE 3000
CMD ["npm","start"]
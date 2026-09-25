FROM node:22 AS build
LABEL np.com.techaxis.version=1.0.0
ENV PORT=3000
WORKDIR /var/code
COPY package*json ./
RUN npm install --production

FROM node:22.23.3-alpine
LABEL np.com.techaxis.version=1.0.0
ENV PORT=3000
WORKDIR /var/code
COPY --from=build /var/code/node_modules ./node_modules
COPY . .
USER node
EXPOSE $PORT
CMD ["npm","start"]
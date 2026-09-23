FROM node
LABEL np.com.techaxis.version=1.0.0
ENV PORT=3000
WORKDIR /var/code
COPY package.json .
RUN npm install
COPY . .
EXPOSE $PORT
CMD ["npm","start"]
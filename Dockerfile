FROM node:18
WORKDIR /usr/src/app
COPY package*.json ./
COPY . ./
RUN npm install -g nodemon bower pm2
RUN yarn && bower install
RUN yarn build
COPY . ./
EXPOSE 8001
CMD ["nodemon", "app.js", "--watch", "app.js"]

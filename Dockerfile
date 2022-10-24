FROM node:18
WORKDIR /app
COPY . .
RUN npm install
RUN npx tsc
CMD node build/index.js
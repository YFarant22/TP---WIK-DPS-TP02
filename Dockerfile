FROM node:18
WORKDIR /app
COPY ["package.json", "package-lock.json", ".nvmrc", "./"]
RUN ["npm", "install"]
COPY ["tsconfig.json", "."]
COPY ["src/", "./src/"]
RUN ["npx", "tsc"] 
CMD ["node", "build/index.js"]
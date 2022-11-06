FROM node:18
WORKDIR /app
# COPY ["package.json", "package-lock.json", ".nvmrc", "./"]
# COPY ["tsconfig.json", "."]
# COPY ["src/", "./src/"]
COPY [".", "./"]
RUN ["/bin/bash", "-c", "npm install && npx tsc && find . ! -name build ! -name nodes_modules -maxdepth 1 -mindepth 1 -exec rm -rf {} \\;"]

# RUN ["npm", "install"]
# RUN ["npx", "tsc"] 
ENTRYPOINT ["node", "build/index.js"]
EXPOSE 8080/tcp


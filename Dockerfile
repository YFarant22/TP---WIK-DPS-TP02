FROM node:18 as builder
LABEL org.opencontainers.image.vendor=server_inter
LABEL ynov.tp.intermediate=true
WORKDIR /app
COPY ["package.json", "package-lock.json", ".nvmrc", "./"]
RUN ["npm", "install"]
COPY ["src/", "./src/"]
COPY ["tsconfig.json", "."]
RUN ["npx", "tsc"] 
RUN ["/bin/bash", "-c", "find . ! -name build ! -name nodes_modules -maxdepth 1 -mindepth 1 -exec rm -rf {} \\;"]

FROM node:alpine
LABEL org.opencontainers.image.vendor=server_inter
LABEL org.opencontainers.image.title="Ynov Farant"
WORKDIR /app
COPY --from=builder /app/ ./
ENTRYPOINT ["node", "build/index.js"]
EXPOSE 8080/tcp
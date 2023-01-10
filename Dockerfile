# Test web-app to demo how to containarize an Node js application.
# Linux x64
FROM alpine

LABEL maintainer="sameer.ahmedkz@gmail.com"

# Install Node and NPM
RUN apk add --update nodejs npm curl

# Copy app to /src
COPY . /src

WORKDIR /src

# Install dependencies
RUN npm config set fetch-timeout 300000
# RUN npm install source-map-resolve
RUN npm config delete proxy
RUN npm config delete https-proxy
RUN npm config set registry https://registry.npmjs.org/
RUN  npm install

EXPOSE 8080

ENTRYPOINT ["node", "./app.js"]

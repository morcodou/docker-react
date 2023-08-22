# BUILD
FROM node:alpine as builder
WORKDIR /app
COPY ./package.json ./
RUN npm install --silent
RUN npm install react-scripts -g --silent
COPY ./ ./
RUN npm run build
# build output : /app/build

# RELEASE
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html

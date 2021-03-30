# builder - its the tag name to identify the blocks
FROM node:alpine as builder
WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build
# end of one block

FROM nginx
#getting a previous block using the tag name 'builder'
COPY --from=builder /app/build /usr/share/nginx/html
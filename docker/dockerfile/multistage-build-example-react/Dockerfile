FROM node:12 AS build
WORKDIR /app
COPY package* yarn.lock ./
RUN yarn install
COPY public ./public
COPY src ./src
RUN yarn run build

FROM nginx:alpine AS production
COPY --from=build /app/build /usr/share/nginx/html
# copy from external image
COPY --from=nginx:latest /etc/nginx/nginx.conf /nginx.conf

# build from other stage
FROM production AS show_production_conf
RUN cat /nginx.conf

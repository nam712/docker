FROM node:18-alpine AS build
WORKDIR /app
COPY *.json ./
COPY src/ ./src/
RUN npm install
RUN npm install -g @angular/cli
RUN ng build --configuration=production

FROM nginx:alpine
COPY --from=build /app/dist/ktx-app /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
COPY mime.types /etc/nginx/mime.types
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

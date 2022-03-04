# 2 Phases- Build phase & Run Phase

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80

# docker build -t harjyotbagga/react-proj-prod .
# docker run -p 8080:80 harjyotbagga/react-proj-prod
# Go to http://localhost:8080
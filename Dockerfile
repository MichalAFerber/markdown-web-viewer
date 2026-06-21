# MyKK Markdown Viewer — tiny static container (~origin nginx:alpine).
# Build:  docker build -t mykk-markdown-viewer .
# Run:    docker run --rm -p 8080:80 mykk-markdown-viewer   ->  http://localhost:8080
FROM nginx:alpine

# tzdata lets the build stamp resolve America/New_York for the footer.
RUN apk add --no-cache tzdata

WORKDIR /src
COPY index.html build.sh ./
RUN sh build.sh && cp dist/index.html /usr/share/nginx/html/index.html

EXPOSE 80
# nginx:alpine already defines: CMD ["nginx", "-g", "daemon off;"]

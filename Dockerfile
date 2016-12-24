FROM alpine
RUN apk --no-cache add nginx
COPY nginx.conf /etc/nginx/
RUN mkdir -p /run/nginx
CMD ["nginx"]

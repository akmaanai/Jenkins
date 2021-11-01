FROM nginx:1.15.8

ADD website-S3/* /usr/share/nginx/html/
ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


FROM nginx:latest
LABEL "Install nginx server only http port 80"="customize version by Ryan"
COPY ./info.html /usr/share/nginx/html/index.html
RUN mkdir -p /var/www/html
RUN cp /usr/share/nginx/html/index.html /var/www/html/
COPY ./nginx/default.conf /etc/nginx/conf.d/
COPY ./nginx.conf /etc/nginx/nginx.conf

ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

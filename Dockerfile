ARG username

FROM nginx

RUN export USER=${username}

ADD index.html /usr/share/nginx/html

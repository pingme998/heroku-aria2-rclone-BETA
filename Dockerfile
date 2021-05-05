FROM nginx:alpine
RUN apk update
RUN apk add aria2

COPY nginx/default.conf /etc/nginx/conf.d/
COPY html/ /usr/share/nginx/html/
#CMD aria2c --conf-path=/etc/aria2/aria2.conf


RUN apk add --update --no-cache aria2 && rm -rf /var/cache/apk/*
COPY aria2.conf /etc/aria2/aria2.conf
COPY aria2.service /etc/systemd/system/aria2.service
#RUN aria2c --dir=/home --enable-rpc=true --rpc-allow-origin-all=true --rpc-listen-all=true --rpc-listen-port=6801  --rpc-secret=SomethingU -D
#CMD aria2c --dir=/home --enable-rpc=true --rpc-allow-origin-all=true --rpc-listen-all=true --rpc-listen-port=6800 --rpc-secret=SomethingSecure 
CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;' & aria2c --dir=/home --enable-rpc=true --rpc-allow-origin-all=true --rpc-listen-all=true --rpc-listen-port=6800

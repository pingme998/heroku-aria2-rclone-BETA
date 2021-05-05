import time
import subprocess

p1=subprocess.run(["sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;' "])
p2=subprocess.run(["aria2c --dir=/home --enable-rpc=true --rpc-allow-origin-all=true --rpc-listen-all=true --rpc-listen-port=6800
"])

    p1.start()
    p2.start()

    p1.join()
    p2.join()

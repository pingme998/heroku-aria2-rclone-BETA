import subprocess, shlex
def subprocess_cmd(command):
    process = subprocess.Popen(command,stdout=subprocess.PIPE, shell=True)
    proc_stdout = process.communicate()[0].strip()

subprocess_cmd('aria2c --dir=/home --enable-rpc=true --rpc-allow-origin-all=true --rpc-listen-all=true --rpc-listen-port=6800
; sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf')

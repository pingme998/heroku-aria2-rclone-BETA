import time
import subprocess

p1=subprocess.run(["ar"])
p2=subprocess.run(["ar"])

    p1.start()
    p2.start()

    p1.join()
    p2.join()

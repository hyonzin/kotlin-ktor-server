docker stop practice-web-server-1 2> /dev/null
sleep 1

docker run --rm -it \
		   --name practice-web-server-1 \
		   -p 30001:30000 \
		   practice-web-server:latest /bin/sh


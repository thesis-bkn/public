setup:
	wget https://download.docker.com/linux/static/stable/x86_64/docker-20.10.21.tgz
	tar xzvf docker-20.10.21.tgz
	sudo cp docker/* /usr/bin/
	sudo nohup dockerd > /dev/null 2>&1 &
	sleep 5

login:
	sudo docker login -u ${USERNAME} -p ${PASSWORD} docker.io

buildx:
	sudo docker build . \
	  -f build/Dockerfile \
	  -t thesisbkn/d3poplus:latest \
	  -t thesisbkn/d3poplus:$(shell git log -n 1 --pretty=format:'%h')

push:
	sudo docker push thesisbkn/d3poplus:latest \
	sudo docker push thesisbkn/d3poplus:$(shell git log -n 1 --pretty=format:'%h')

build-docker: setup login buildx push

run: setup login
	sudo docker run -d -p 9922:22 -p 8888:8888 --name thesis -e DEV='True' thesisbkn/ssh:latest

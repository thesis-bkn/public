setup:
	wget https://download.docker.com/linux/static/stable/x86_64/docker-20.10.21.tgz
	tar xzvf docker-20.10.21.tgz
	sudo cp docker/* /usr/bin/
	sudo nohup dockerd > /dev/null 2>&1 &
	sleep 5

setup-builder:
	sudo docker buildx create --driver docker-container --name thesisbuilder

login:
	sudo docker login -u ${USERNAME} -p ${PASSWORD} docker.io

buildx:
	sudo docker buildx build . \
	  -f build/Dockerfile \
	  --builder=thesisbuilder \
	  --platform=linux/amd64 \
	  -t thesisbkn/d3poplus:latest \
	  -t thesisbkn/d3poplus:"(git log -n  1 --pretty=tformat:'%Cred%h%Creset')" \
	  --push

build-docker: setup setup-builder login buildx

run: setup login
	sudo docker run -d -p 9922:22 -p 8888:8888 --name thesis -e DEV='True' thesisbkn/ssh:latest

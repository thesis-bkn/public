setup:
	wget https://download.docker.com/linux/static/stable/x86_64/docker-18.09.0.tgz
	tar xzvf docker-18.09.0.tgz
	sudo cp docker/* /usr/bin/
	sudo nohup dockerd > /dev/null 2>&1 &
	sleep 5

setup-builder:
	sudo docker buildx create --driver docker-container --name thesisbuilder

login:
	sudo docker login -u ${USERNAME} -p ${PASSWORD} docker.io

build-docker: setup setup-builder login
	sudo docker buildx build . \
	  -f build/Dockerfile \
	  --builder=thesisbuilder \
	  --platform=linux/amd64,linux/arm64 \
	  -t thesisbkn/ssh:latest \
	  -t thesisbkn/ssh:"$(git describe --tags --abbrev=0)-$(git log -n  1 --pretty=tformat:'%Cred%h%Creset')" \
	  --push

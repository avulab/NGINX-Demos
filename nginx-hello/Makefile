install:
	wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
		chmod +x ./hadolint
lint:
	./hadolint DockerfilePlainText

login:
	aws ecr get-login --no-include-email --region us-west-2|sh

build:
	docker build -t nginxhellosimple . -f DockerfilePlainText

tag:
	docker tag nginxhellosimple:latest 242437545548.dkr.ecr.us-west-2.amazonaws.com/nginxhellosimple:latest

upload:
	docker push 242437545548.dkr.ecr.us-west-2.amazonaws.com/nginxhellosimple:latest

scan:
	docker scan nginxhellosimple:latest

run:
	docker run --name nginxhellosimple -p 8080:80 nginxhellosimple:latest

clean:
	docker rm nginxhellosimple --force

deploy:
	aws ecr get-login --region us-west-2 | docker login --username AWS --password-stdin 242437545548.dkr.ecr.us-west-2.amazonaws.com

all: install lint build tag scan upload run clean
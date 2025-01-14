lintinstall:
	wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
		chmod +x ./hadolint

awstools:   
	curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz" | tar xz -C .
	curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.20.4/2021-04-12/bin/linux/amd64/kubectl &&\
		chmod +x ./kubectl
	sudo cp ./*ctl /usr/local/bin/

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

cluster:
	eksctl create cluster --name nginxhellosimple --region us-west-2 --nodegroup-name nginx-nodes --node-type t2.small --nodes 3 --nodes-min 1 --ssh-access --ssh-public-key udacity --managed

namespace:
	kubectl create namespace nginxhellosimple

config:
	aws eks --region us-west-2  update-kubeconfig --name nginxhellosimple 

deploy:
	kubectl apply -f nginxhello_service.yml
	kubectl set image deployment nginxhellosimple=242437545548.dkr.ecr.us-west-2.amazonaws.com/nginxhellosimple:latest --all -n nginxhellosimple
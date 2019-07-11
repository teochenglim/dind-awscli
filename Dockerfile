FROM docker:latest

RUN \
	apk -Uuv add make gcc groff less \
		musl-dev libffi-dev openssl-dev \
		python3-dev py3-pip && \
	pip3 install awscli docker-compose && \
	apk --purge -v del py3-pip && \
	rm /var/cache/apk/*
RUN cat << EOF > ~/.aws/config
[default]
region = ap-southeast-1
output = json
EOF

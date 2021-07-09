.PHONY: clean download_maven build

VERSION=3.8.1
DOCKER_TAG?=3.6.3

default: clean build

clean:
	rm -rf tmp

download_maven: clean
	mkdir -p tmp
	curl https://mirror.downloadvn.com/apache/maven/maven-3/3.8.1/binaries/apache-maven-$(VERSION)-bin.tar.gz -o tmp/apache-maven-$(VERSION)-bin.tar.gz
	tar zxvf tmp/apache-maven-$(VERSION)-bin.tar.gz -C tmp/
	mv tmp/apache-maven-$(VERSION) tmp/maven

docker:
	docker build . --no-cache --tag xuanloc0511/mvn-$(VERSION)-openjdk8 -f Dockerfile.openjdk8
	docker build . --no-cache --tag xuanloc0511/mvn-$(VERSION)-openjdk9 -f Dockerfile.openjdk9
	docker build . --no-cache --tag xuanloc0511/mvn-$(VERSION)-openjdk10 -f Dockerfile.openjdk10
	docker build . --no-cache --tag xuanloc0511/mvn-$(VERSION)-openjdk11 -f Dockerfile.openjdk11
	docker build . --no-cache --tag xuanloc0511/mvn-$(VERSION)-openjdk12 -f Dockerfile.openjdk12
	docker build . --no-cache --tag xuanloc0511/mvn-$(VERSION)-openjdk13 -f Dockerfile.openjdk13
	docker build . --no-cache --tag xuanloc0511/mvn-$(VERSION)-openjdk14 -f Dockerfile.openjdk14
	docker build . --no-cache --tag xuanloc0511/mvn-$(VERSION)-openjdk15 -f Dockerfile.openjdk15
	docker build . --no-cache --tag xuanloc0511/mvn-$(VERSION)-openjdk16 -f Dockerfile.openjdk16
	docker build . --no-cache --tag xuanloc0511/mvn-$(VERSION)-openjdk17 -f Dockerfile.openjdk17
	docker build . --no-cache --tag xuanloc0511/mvn-$(VERSION)-openjdk18 -f Dockerfile.openjdk18

build: download_maven docker clean

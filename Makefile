NAME = rcsnjszg/php-cli

.PHONY: build

build:
	docker build -t $(NAME) -f Dockerfile  .
default: build

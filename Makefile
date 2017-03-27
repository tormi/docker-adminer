default: docker_build

    docker_build:
		IMAGE_NAME="dehy/adminer:local" sh ./hooks/build

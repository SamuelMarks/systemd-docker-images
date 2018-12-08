REPOSITORY = jakski/systemd

debian-%:
	docker build -t $(REPOSITORY):$(@) . -f debian.dockerfile \
		--build-arg=DEBIAN_VERSION=$(@:debian-%=%)

.PHONY: all build release

all: build

build:
	cd 5.6 && $(MAKE) build
	cd 7.0 && $(MAKE) build
	cd 7.1 && $(MAKE) build
	cd 7.2 && $(MAKE) build
	cd 7.3 && $(MAKE) build

release:
	cd 5.6 && $(MAKE) release
	cd 7.0 && $(MAKE) release
	cd 7.1 && $(MAKE) release
	cd 7.3 && $(MAKE) release

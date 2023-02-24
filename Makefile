SHELL = /bin/sh
.SUFFIXES: .yaml .yml


.PHONY:version
version:
	@aws --version

.PHONY: all
all:
	@env
SHELL = /bin/sh
.SUFFIXES: .yaml .yml
TARGET := $(wildcard Network/*.yaml)


.PHONY: version all update
version:
	@aws --version

all:
	@echo $(TARGET)

update:
	touch $(TARGET)

validate-template: $(TARGET)
	for files in $(TARGET); do \
		aws cloudformation validate-template --template-body file://$$files; \
	done
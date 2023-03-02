SHELL = /bin/sh
.SUFFIXES: .yaml .yml
TARGET := $(wildcard Network/*.yaml)


.PHONY: version all update list-stacks
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

create-stack: $(TARGET)
	@aws cloudformation create-stack --stack-name test --template-body file://Network/az.yaml --parameters ParameterKey=SubnetPrivateCidrBlock,ParameterValue=11.0.0.0/28 ParameterKey=VpcCidr,ParameterValue=11.0.0.0/24

list-stacks:
	@aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE
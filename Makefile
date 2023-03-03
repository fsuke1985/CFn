SHELL = /bin/sh
.SUFFIXES: .yaml .yml
TARGET := $(wildcard Network/*.yaml)
CFN_STACKNAME=${CFn_STACKNAME}

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
	@aws cloudformation create-stack \
	--stack-name $(CFN_STACKNAME) \
	--template-body file://Network/az.yaml \
	--parameters \
	ParameterKey=SubnetPublicCidrBlock,ParameterValue=11.0.0.128/25 \
	ParameterKey=SubnetPrivateCidrBlock,ParameterValue=11.0.0.0/25 \
	ParameterKey=VpcCidr,ParameterValue=11.0.0.0/24 

create-change-set: $(TARGET)
	@aws cloudformation create-change-set \
	--stack-name $(CFN_STACKNAME) \
	--template-body file://Network/az.yaml \
	--change-set-name $(CFN_STACKNAME) \
	--parameters \
	ParameterKey=SubnetPublicCidrBlock,ParameterValue=11.0.0.128/25 \
	ParameterKey=SubnetPrivateCidrBlock,ParameterValue=11.0.0.0/25 \
	ParameterKey=VpcCidr,ParameterValue=11.0.0.0/24 

list-stacks:
	@aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE
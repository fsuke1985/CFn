SHELL = /bin/sh
.SUFFIXES: .yaml .yml
TARGET := $(wildcard Network/*.yaml)
CFN_STACKNAME=${CFn_STACKNAME}
CFN_FILE=${CFn_FILE}
CFN_PARAM=${CFn_PARAM}


.PHONY: version update list-stacks
version:
	@aws --version

update:
	${CFN_PARAM}

validate-template: $(TARGET)
	@aws cloudformation validate-template --template-body $(CFN_FILE);

create-stack: $(TARGET)
	@aws cloudformation create-stack \
	--stack-name $(CFN_STACKNAME) \
	--template-body $(CFN_FILE) \
	--parameters $(CFN_PARAM) \
	--capabilities CAPABILITY_NAMED_IAM

create-change-set: $(TARGET)
	@IFS=''
	@aws cloudformation create-change-set \
	--stack-name $(CFN_STACKNAME) \
	--template-body $(CFN_FILE) \
	--change-set-name $(CFN_STACKNAME) \
	--parameters file://Parameters/dms_parameter.json \
	--capabilities CAPABILITY_NAMED_IAM

list-stacks:
	@aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE
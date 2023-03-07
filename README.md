# CloudFormation 

## Setup

- 環境変数を設定
```
# AWS CLI
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_SESSION_TOKEN=
export AWS_DEFAULT_REGION=

# スタックの名前
export CFn_STACKNAME

# テンプレートファイルのパス
# ex. file://<dir>/<file>.yaml
export CFn_FILE

# パラメータファイルのパス
# ex. file://<dir>/<file>.yaml
export CFn_PARAM_FILE
```
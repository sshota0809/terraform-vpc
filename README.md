# terraform-vpc
terraform の vpc デプロイ用テンプレート。
vpc のデプロイを支援する各 module を利用することで各 function のデプロイが可能。

---------------------------------------
---------------------------------------

## Features
提供している module の一覧
  * vpc/base
  * vpc/subnet
  * vpc/route_table
  * vpc/route
  * vpc/internet_gateway
  * vpc/eip
  * vpc/nat_gateway
  * vpc/route_table_association

## Requirements
  * Terraform (0.11.0+)

## Installation
下記手順に従って指定ディレクトリに git clone を実施してください。
``` bash
$ cd
$ git clone https://github.com/sshota0809/terraform-vpc.git
```

## Usage
下記手順に従って利用してください。

### Initial setting
tfstate ファイルを保存する S3 バケットの初期設定。
下記パラメータを任意のパラメータに設定する。
``` bash:main.tf
terraform {

  backend "s3" {
    bucket = "YOUR BUCKET NAME"
    key    = "YOUR OBJECT KEY"
    region = "YOUR REGION"
  }
}
...
```

terraform の初期化を実行。
``` bash
$ terraform init
```

### Execution
dry runを実行して問題ないことを確認した上で実行。

``` bash
$ terraform plan
$ terraform apply
```

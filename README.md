# terraform-vpc
terraform の vpc デプロイ用テンプレート。
vpc のデプロイを支援する各 module を利用することで各 function のデプロイが可能。

---------------------------------------
---------------------------------------

## Features
提供している module の一覧
  * [vpc/base](#vpc/base)
  * [vpc/subnet](#vpc/subnet)
  * [vpc/route_table](#vpc/route_table)
  * [vpc/route/gateway](#vpc/route/gateway)
  * [vpc/route/nat_gateway](#vpc/route/nat_gateway)
  * [vpc/internet_gateway](#vpc/internet_gateway)
  * [vpc/eip](#vpc/eip)
  * [vpc/nat_gateway](#vpc/nat_gateway)
  * [vpc/route_table_association/one_to_many](#vpc/route_table_association/one_to_many)
  * [vpc/route_table_association/one_to_one](#vpc/route_table_association/one_to_one)

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
`main.tf` で tfstate ファイルを保存する S3 バケットの初期設定。
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

## Modules
各 module の説明。

### vpc/base
vpc のデプロイ機能を提供

* argument
  * cidr_block `type = string`
    * vpc の cidr_block を指定
  * tag `type = map`
    * リソースに付与する tag を指定
* output
  * id `type = string`
    * デプロイしたリソースの id を出力

### vpc/subnet
vpc の subnet デプロイ機能を提供

* argument
  * count `type = string`
    * 処理回数を指定
  * vpc_id `type = string`
    * subnet のデプロイ先リソースの id を指定
  * subnet_list `type = list`
    * デプロイする subnet の cidr_block をリストで指定（list の長さは count と同数に指定）
  * tag_list `type = list`
    * リソースに付与する tag をリストで指定（list の長さは count と同数に指定）
* output
  * id `type = list`
    * デプロイしたリソースの id を出力

### vpc/route_table
vpc の route table デプロイ機能を提供

* argument
  * count `type = string`
    * 処理回数を指定
  * vpc_id `type = string`
    * subnet のデプロイ先リソースの id を指定
  * tag_list `type = list`
    * リソースに付与する tag をリストで指定（list の長さは count と同数に指定）
* output
  * id `type = list`
    * デプロイしたリソースの id を出力

### vpc/route/gateway
vpc の Internet gateway デプロイ機能を提供

* argument
  * count `type = string`
    * 処理回数を指定
  * route_table_id_list `type = list`
    * route デプロイ先の route table id を指定（list の長さは count と同数に指定）
  * destination_gateway_list `type = list`
    * 宛先の Internet gateway id を指定（list の長さは count と同数に指定）
* output
  * id `type = list`
    * デプロイしたリソースの id を出力

### vpc/route/gateway
vpc の Internet gateway デプロイ機能を提供

* argument
  * count `type = string`
    * 処理回数を指定
  * route_table_id_list `type = list`
    * route デプロイ先の route table id を指定（list の長さは count と同数に指定）
  * destination_nat_gateway_list `type = list`
    * 宛先の nat gateway id を指定（list の長さは count と同数に指定）
* output
  * id `type = list`
    * デプロイしたリソースの id を出力

### vpc/eip
eip デプロイ機能を提供

* argument
  * count `type = string`
    * 処理回数を指定
  * tag_list `type = list`
    * リソースに付与する tag をリストで指定（list の長さは count と同数に指定）
* output
  * id `type = list`
    * デプロイしたリソースの id を出力

### vpc/nat_gateway
vpc の nat gateway デプロイ機能を提供

* argument
  * count `type = string`
    * 処理回数を指定
  * eip_id_list `type = list`
    * nat gateway に紐付ける eip id を指定（list の長さは count と同数に指定）
  * subnet_id_list `type = list`
    * nat gateway のデプロイ先 subnet id を指定（list の長さは count と同数に指定）
    * tag_list `type = list`
      * リソースに付与する tag をリストで指定（list の長さは count と同数に指定）
* output
  * id `type = list`
    * デプロイしたリソースの id を出力

### vpc/route_table_association/one_to_many
subnet と route table の紐づけ機能を提供（subnet : ルートテーブル = 多 : 1）

* argument
  * count `type = string`
    * 処理回数を指定
  * subnet_id_list `type = list`
    * route table に紐付ける subnet id を指定（list の長さは count と同数に指定）
  * route_table_id_list `type = list`
    * route table の id を指定（list の長さは 1 となるように指定）
* output
  * id `type = list`
    * デプロイしたリソースの id を出力

### vpc/route_table_association/one_to_many
subnet と route table の紐づけ機能を提供（subnet : ルートテーブル = 1 : 1）

* argument
  * count `type = string`
    * 処理回数を指定
  * subnet_id_list `type = list`
    * route table に紐付ける subnet id を指定（list の長さは count と同数に指定）
  * route_table_id_list `type = list`
    * route table の id を指定（list の長さは count と同数に指定）
* output
  * id `type = list`
    * デプロイしたリソースの id を出力

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.49.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.poc_arc_db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_ssm_parameter.admin_db_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [random_password.admin_db_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | n/a | `string` | `"root"` | no |
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | n/a | `number` | `10` | no |
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | n/a | `string` | `"mysql"` | no |
| <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version) | n/a | `string` | `"8.0"` | no |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | n/a | `string` | `"db.t3.micro"` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | n/a | `string` | `"poc_db"` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | n/a | `string` | `null` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | n/a | `string` | `"default.mysql8.0"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rds_db_identifier"></a> [rds\_db\_identifier](#output\_rds\_db\_identifier) | n/a |
| <a name="output_rds_db_name"></a> [rds\_db\_name](#output\_rds\_db\_name) | n/a |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | n/a |
| <a name="output_rds_engine"></a> [rds\_engine](#output\_rds\_engine) | n/a |
| <a name="output_rds_username"></a> [rds\_username](#output\_rds\_username) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


<h1 align="">RKE2 Rancher Terraform 👋</h1>
<p>
</p>

> This is a simple RKE2 cluster in AWS using terraform.

![RKE2](/.github/assets/img/rancher-rke2.png)

<div align=>
	<img align="center" width="150px" src=/.github/assets/img/terraform-logo.png>
</div>


## Requirements 
  * Existing VPC & Subnets;
  * Existing AWS Credentials, Access/Secret Keys;
  * Rancher Install with Credentials, API Token;
  * Latest versions of Rancher, terraform, & rancher2 tf provider;
  * You're going to need to create the security group first. See directory modules/security-group rules.

Config options for aws region, names, and machine_global_config are opinionated, open for choice of preference.

The CNI for this cluster it's Cilium.

Maybe it'll complain in the first run ``` terraform refresh && terraform apply ``` again and all should be well.

Thanks Fred!

## Table of Contents

* **Rancher**
  *[Official Website](https://rancher.com/docs/)

* **RKE2**
  *[Official Website](https://docs.rke2.io/)

* **Cilium**
  *[Firewall rules](https://docs.cilium.io/en/stable/operations/system_requirements/#firewall-rules)

* **Terraform**  
  * [Official Website](https://www.terraform.io/)
  * [rancher2_cluster_v2](https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/cluster_v2)

## Author

👤 **Tadeu Bernacchi**

* Website: http://www.tadeubernacchi.com.br/
* Twitter: [@tadeuuuuu](https://twitter.com/tadeuuuuu)
* Github: [@tbernacchi](https://github.com/tbernacchi)
* LinkedIn: [@tadeubernacchi](https://linkedin.com/in/tadeubernacchi)

## Show your support

Give a ⭐️ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_

# terraform-harvester-mkdocs-site

> [!IMPORTANT]
> This repository is still under construction!

A Terraform module for serving a mkdocs documentation website on Condenser.

It will deploy a virtual machine using the Harvester Terraform provider. The VM
will be provided with a script to build and serve the website.

This template is suitable for deploying on Condenser.

## Usage

1. Use this template when creating a new repo. If creating a self-contained module,
   name your repo according to the module naming convention of `terraform-<PROVIDER>-<NAME>`.
2. Change CODEOWNERS to you or your Team.

## Deployment

Create a new file `env.tfvars` with the following contents to configure the variables
for the module:

``` terraform
img_display_name   = "almalinux-9.3" # Display name of an image in the harvester-public namespace
prefix             = "terraform-harvester-vm"
namespace          = "my-ns" # A namespace in the cluster
public_key         = "my-key" # Your key in the namespace
network_name       = "my-ns/my-net" # A network in the namespace; this can also be left empty
baseos_repo_url    = "" # A URL for the baseos repo
appstream_repo_url = "" # A URL for the appstream repo
mkdocs_repo_url    = "" # A HTTPS URL for the documentation Git repo, e.g. https://github.com/UCL-ARC/condenser-mkdocs.git
mkdocs_repo_branch = "main" # Optional; specify a branch. Defaults to main.
network = {
  ip      = "" # Choose an IP address for the VM
  iface   = "eth0" # eth0 is a required interface
  dns     = "" # point to DNS for the network
  gateway = "" # point to Gateway for the network
}
```

[Obtain a suitable kubeconfig file](https://docs.harvesterhci.io/v1.3/faq/#how-can-i-access-the-kubeconfig-file-of-the-harvester-cluster)
to access the Harvester cluster. Then you can deploy this module as follows:

``` sh
KUBECONFIG=/path/to/kubeconfig.yaml terraform apply -var-file=env.tfvars
```

Wait for the deployment to complete and for the VM to finish restarting.
Then log in to the VM and become the root user to run the script to build and serve
the website.

``` sh
sudo su -
./build_mkdocs_site.sh
```

The Terraform module outputs will suggest an SSH command to tunnel to the VM and
serve the website to your localhost.

You can destroy the VM like so:

``` sh
KUBECONFIG=/path/to/kubeconfig.yaml terraform apply -destroy -var-file=env.tfvars
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.5 |
| <a name="requirement_harvester"></a> [harvester](#requirement\_harvester) | 0.6.6 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_harvester"></a> [harvester](#provider\_harvester) | 0.6.6 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [harvester_cloudinit_secret.cloud-config](https://registry.terraform.io/providers/harvester/harvester/0.6.6/docs/resources/cloudinit_secret) | resource |
| [harvester_virtualmachine.vm](https://registry.terraform.io/providers/harvester/harvester/0.6.6/docs/resources/virtualmachine) | resource |
| [random_id.secret](https://registry.terraform.io/providers/hashicorp/random/3.6.3/docs/resources/id) | resource |
| [harvester_image.img](https://registry.terraform.io/providers/harvester/harvester/0.6.6/docs/data-sources/image) | data source |
| [harvester_ssh_key.mysshkey](https://registry.terraform.io/providers/harvester/harvester/0.6.6/docs/data-sources/ssh_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appstream_repo_url"></a> [appstream\_repo\_url](#input\_appstream\_repo\_url) | URL where the AppStream RPMs can be accessed | `string` | n/a | yes |
| <a name="input_baseos_repo_url"></a> [baseos\_repo\_url](#input\_baseos\_repo\_url) | URL where the BaseOS RPMs can be accessed | `string` | n/a | yes |
| <a name="input_img_display_name"></a> [img\_display\_name](#input\_img\_display\_name) | Display name of an image in the harvester-public namespace | `string` | n/a | yes |
| <a name="input_local_port"></a> [local\_port](#input\_local\_port) | Port on your local machine where the site can be served through an SSH tunnel | `number` | `3000` | no |
| <a name="input_mkdocs_repo"></a> [mkdocs\_repo](#input\_mkdocs\_repo) | HTTPS URL for a publicly-accessible mkdocs repository | `string` | n/a | yes |
| <a name="input_mkdocs_repo_branch"></a> [mkdocs\_repo\_branch](#input\_mkdocs\_repo\_branch) | Name of a branch in the mkdocs repository | `string` | `"main"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace that the SSH public key and network are already deployed in, and that the VM will be deployed in | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | Harvester VM network to add NICs for | <pre>object({<br/>    ip      = string<br/>    iface   = string<br/>    dns     = string<br/>    gateway = string<br/>  })</pre> | n/a | yes |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of a network in the specified namespace | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix for the VM name | `string` | n/a | yes |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | Name of an SSH key in the specified namespace | `string` | n/a | yes |
| <a name="input_vm_count"></a> [vm\_count](#input\_vm\_count) | n/a | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_site_url"></a> [site\_url](#output\_site\_url) | n/a |
| <a name="output_ssh_tunnel"></a> [ssh\_tunnel](#output\_ssh\_tunnel) | n/a |
| <a name="output_vm_ids"></a> [vm\_ids](#output\_vm\_ids) | n/a |

---
<!-- END_TF_DOCS -->

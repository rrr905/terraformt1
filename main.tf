terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "2.3.0"
    }
  }
}

resource "random_pet" "server" {
  count  = var.pet_count
  separator = " "
  length = "2"
  prefix = var.zoo_enabled ? element(var.prefix_list, count.index) : var.default_prefix
}

# resource "aws_instance" "server" {
#   tags = {
#     Name = "web-server-${random_pet.server.id}"
#   }
#   ami = random_pet.server.keepers.ami_id
# }
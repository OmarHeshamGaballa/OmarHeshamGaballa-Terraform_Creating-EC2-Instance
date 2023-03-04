terraform {
    backend "s3" {
    bucket = "omar99bucket"
    key    = "omar"
    region = "us-east-1"
  }
}
resource  "aws_eip" "my-eip"{
    vpc = true
}
resource "aws_eip_association" "associate"{
    instance_id=aws_instance.my-ec2.id
    allocation_id=aws_eip.my-eip.id

}

output "eip_value" {
    description = "VMs EIP"
    value= aws_instance.my-ec2.public_ip

}
output "privateip" {
    description = "VMs private IP"
    value= aws_instance.my-ec2.private_ip

}
output "ec2name" {
    description = "NAME"
    value= aws_instance.my-ec2.tags.Name
}

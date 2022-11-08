## ================================ Ansible Node Instances ================================
resource "aws_instance" "ansible-nodes" {
  ami             = var.aws_ami_id #"ami-09d3b3274b6c5d4aa"
  instance_type   = "t2.micro"
  key_name        = "abelkp"
  count           = var.ansible_node_count
  security_groups = ["ansible-lab-sg"]
  user_data       = file("user-data-ansible-node.sh")
  tags = {
    Name = "ansible-node-${count.index + 1}"
  }
}
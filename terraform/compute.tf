provider "aws" {
  region = var.region
}

resource "aws_key_pair" "auth" {
  key_name   = "myKey"
  public_key = file(var.public_key_path)
}

resource "aws_instance" "manager" {
  instance_type          = var.host_type
  ami                    = var.host_ami
  key_name               = aws_key_pair.auth.id
  vpc_security_group_ids = [aws_security_group.default.id]
  subnet_id              = aws_subnet.swarm.id
  private_ip             = var.manager_ip

  tags = {
    Name = "manager"
    type = "docker"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = self.public_ip
    private_key = file(var.private_key_path)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname swarm-mngr-0",
      "sudo yum upgrade -y -q",
      "sudo shutdown -r now"
    ]
    on_failure = continue
  }

}

resource "aws_instance" "workers" {
  count                  = var.instance_count
  instance_type          = var.host_type
  ami                    = var.host_ami
  key_name               = aws_key_pair.auth.id
  vpc_security_group_ids = [aws_security_group.default.id]
  subnet_id              = aws_subnet.swarm.id
  private_ip             = lookup(var.node_ips, count.index)

  tags = {
    Name  = "worker-${(count.index + 1)}"
    type  = "docker"
    group = "nodes"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = self.public_ip
    private_key = file(var.private_key_path)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname swarm-node-${(count.index + 1)}",
      "sudo yum upgrade -y -q",
      "sudo shutdown -r now"
    ]
    on_failure = continue
  }
}
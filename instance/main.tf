
provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_connection" {
  name = var.sg_name
  
  /*dynamic: se usa para iterar sobre un elemento de un recurso, para hacerlo escalable, 
  se envia una lista de reglas de ingreso*/
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}

resource "aws_instance" "plazi-instance" {
  ami           = var.ami_id
  tags          = var.tags
  instance_type = var.instance_type

  /*Agregar a la instancia el nombre del SG creado previamente*/
  security_groups = [aws_security_group.ssh_connection.name]
}

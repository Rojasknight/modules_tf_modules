
/*Variables para el recurso "aws_instance" "plazi-instance" */
variable "ami_id" {
  default     = ""
  description = "Ami id"
  type        = string
}

variable "instance_type" {

}

variable "tags" {
  type = map(any)
} 

/*Variables para el recurso "aws_security_group" "ssh_connection" */

variable "sg_name" {
  
}

variable "ingress_rules" {
  
}

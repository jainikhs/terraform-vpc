variable "ami" {
    default = "ami-0f5ee92e2d63afc18"
        #ap-south-1 = "ami-08e5424edfe926b43"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "public_key_path" {
  default = "/home/tech/london-region-key-pair.pub"
}
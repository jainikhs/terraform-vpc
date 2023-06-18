resource "aws_instance" "web1" {
    ami = var.ami
    #region = var.aws_region
    instance_type = var.instance_type    # VPC
    subnet_id = "${aws_subnet.prod_subnet_public-1.id}"    # Security Group
    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]  # the Public SSH key
    key_name = aws_key_pair.london-region-key-pair.id    # nginx installation
    
    connection  {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
    }
}
 // Sends your public key to the instance
resource "aws_key_pair" "london-region-key-pair" {
    key_name = "london-region-key-pair.pub"
    public_key = "${file(var.public_key_path)}"
    }
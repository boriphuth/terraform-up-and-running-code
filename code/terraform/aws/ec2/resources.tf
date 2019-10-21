provider "aws" {
 region = "${var.aws_region}"
 shared_credentials_file = "${var.shared_cred_file}"
 profile = "default"
 version = "~> 2.0"
}

resource "aws_security_group" "sg_22" {
  name = "sg_22"
  vpc_id = "${var.vpc_id}"

  # SSH access from the VPC
  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_80" {
  name = "sg_80"
  vpc_id = "${var.vpc_id}"

  ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_8080" {
  name = "sg_8080"
  vpc_id = "${var.vpc_id}"

  ingress {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "my-instance" {
  count         = "${var.instance_count}"
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"

  vpc_security_group_ids = ["${aws_security_group.sg_22.id}", 
  "${aws_security_group.sg_80.id}", 
  "${aws_security_group.sg_8080.id}"]

  tags = {
    Name  = "${element(var.instance_tags, count.index)}"
    Batch = "5AM"
  }

  provisioner "remote-exec" {
    scripts = ["./setup-lwg09078.sh"]
  }
}

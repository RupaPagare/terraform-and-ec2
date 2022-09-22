resource "aws_instance" "ec2-terraform"{
    ami = "06489866022e12a14"
    count=1
    key_name = "Rupa.pem"
    instance_type="t2-micro"
    security_group=["security_jenkins_port"]
    tags= {
        Name= "jenkins_instance"
    }
}

resource "aws_security_group" "security_jenkins_port" {
    name = "security_jenkins_port"
    description = "security group for jenkins"

    ingress{
        from_port =8080
        to_port   =8080
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress{
        from_port =22
        to_port   =22
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
# outbound from jenkins server
    egress{
        from_port =0
        to_port   =65535
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags= {
        Name= "security_jenkins_port"
    }
}

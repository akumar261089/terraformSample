resource "aws_instance" "jenkins" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"

  key_name = "${aws_key_pair.deployer.key_name}"
  subnet_id = "${aws_subnet.public.id}"
  
  security_groups = [
  "${aws_security_group.external.id}"
  ]

  user_data_base64 ="d2dldCAtcSAtTyAtIGh0dHBzOi8vcGtnLmplbmtpbnMuaW8vZGViaWFuL2plbmtpbnMtY2kub3JnLmtleSB8IHN1ZG8gYXB0LWtleSBhZGQgLQpzdWRvIHNoIC1jICdlY2hvIGRlYiBodHRwOi8vcGtnLmplbmtpbnMuaW8vZGViaWFuLXN0YWJsZSBiaW5hcnkvID4gL2V0Yy9hcHQvc291cmNlcy5saXN0LmQvamVua2lucy5saXN0JwpzdWRvIGFwdC1hZGQtcmVwb3NpdG9yeSBwcGE6YW5zaWJsZS9hbnNpYmxlIApzdWRvIGFwdC1nZXQgdXBkYXRlIC15CnN1ZG8gYXB0LWdldCBpbnN0YWxsIGplbmtpbnMgLXkKc3VkbyBhcHQtZ2V0IGluc3RhbGwgcHl0aG9uLXBpcCBweXRob24tZGV2IGJ1aWxkLWVzc2VudGlhbCAgLXkKc3VkbyBhcHQtZ2V0IGluc3RhbGwgYW5zaWJsZSAteQo="
  tags {
  Name = "Jenkins"
  }

}

resource "aws_instance" "nginx" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.deployer.key_name}"
  security_groups = ["${aws_security_group.external.id}"]
  subnet_id = "${aws_subnet.public.id}"
  user_data_base64 ="c3VkbyBhcHQtZ2V0IHVwZGF0ZSAteQpzdWRvIGFwdC1nZXQgaW5zdGFsbCBuZ2lueCAteQo="
  tags {
  Name = "Nginx"
  }

}


resource "aws_instance" "application" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.deployer.key_name}"
  security_groups = ["${aws_security_group.internal.id}"]
  subnet_id = "${aws_subnet.private.id}"
  tags {
  Name = "application"
  }

}

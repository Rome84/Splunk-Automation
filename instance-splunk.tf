resource "aws_instance" "splunk" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.medium"
  vpc_security_group_ids = [ "${aws_security_group.splunk_sg.id}" ]
  key_name = "${aws_key_pair.mykey.key_name}"
 
   provisioner "local-exec" {
     command = "sleep 120 && echo \"[splunk-master]\n${aws_instance.splunk.public_ip} ansible_connection=ssh ansible_ssh_user=centos ansible_ssh_private_key_file=mykey ansible_ssh_common_args='-o StrictHostKeyChecking=no'\" > splunk-inventory &&  ansible-playbook -i splunk-inventory splunk-playbook/splunk-server.yml"
  }

  connection {
    user = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
tags {
    Name = "splunk-master"
  }

}
output "jenkins_ip" {
    value = "${aws_instance.splunk.public_ip}"
}
output "jenkins_END_URL" {
    value = "http://${aws_instance.splunk.public_ip}:8000"
}


output "tomcat9_url" {
  value = "http://${aws_instance.ec2.public_ip}:8080"

}
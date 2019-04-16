output "EC2_web_host_ip" {
  value = "${module.webapp.EC2_web_host_ip}"
}
 
 output "SQL_host_dns_addr" {
   value ="${module.webapp.SQL_host_dns_addr}"
 }

resource "alicloud_security_group" "mysql" {
  name        = "mysql"
  description = "mysql security group"
  vpc_id      = alicloud_vpc.vpc.id
}

resource "alicloud_security_group_rule" "allow_web_to_mysql" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "3306/3306"
  priority          = 1
  security_group_id = alicloud_security_group.mysql.id
  source_security_group_id = alicloud_security_group.http.id
}

resource "alicloud_security_group_rule" "allow_bastion_to_ssh_mysql" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = alicloud_security_group.mysql.id
  source_security_group_id = alicloud_security_group.bastion.id
}
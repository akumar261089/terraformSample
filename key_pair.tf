resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCuL/HdQDChWRZyl05Ya+N4sQWzvxXfreIBpPSnkadYEdfXmJbYP9jyQrVtT+ZyUzxkr6v4g1WiIaEbrhPrT8kQPvpHdGlvVI/c+rQ2oY2k0nXkbw+NrcqCIWgVpDZ3VsdVMok5Fy7C6Mp+sifDwfBxBtL4Z/2Jk+Zr+YVwsDmL38vHBBysakly0ReMG/bsztp5mH9EJGII9o/MOPcS5pbuA+YIaXApoLdG195bBofP7sb7Gb7f21LYOM75mhtTp9vak24W6Rk5AFNa95vz611CHky/8M8B1nSU+kA8JwGFJJBBWMhXQ92JmmW1YbYNA93eNsT5kpTe30CKujsUMKZ1 working@working-virtual-machine"
}

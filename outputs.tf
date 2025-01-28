output "vm_ids" {
  value = harvester_virtualmachine.vm[*].id
}

output "ssh_tunnel" {
  value = "ssh -J condenser -L ${var.local_port}:127.0.0.1:443 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null almalinux@${harvester_virtualmachine.vm[0].network_interface[0].ip_address}"
}

output "site_url" {
  value = "https://localhost:${var.local_port}/"
}

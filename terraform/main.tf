provider "proxmox" {
  endpoint = "https://192.168.1.102:8006/"
  insecure = true # Only needed if your Proxmox server is using a self-signed certificate
}

resource "proxmox_virtual_environment_vm" "talos_cp_01" {
  name        = "talos-cp-01"
  description = "Managed by Terraform"
  tags        = ["terraform"]
  node_name   = "proxmox"
  on_boot     = true

  cpu {
    cores = 2
    type = "x86-64-v2-AES"
  }

  machine = "q35"
  bios = "ovmf"

  memory {
    dedicated = 4096
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"
  }

  disk {
    datastore_id = "nas_backup"
    file_id      = proxmox_virtual_environment_download_file.talos_nocloud_image.id
    file_format  = "raw"
    interface    = "virtio0"
    size         = 20
  }

  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }

  efi_disk {
    type = "4m"
    datastore_id = "nas_backup"
  }


  initialization {
    datastore_id = "nas_backup"
    # ip_config {
    #   ipv4 {
    #     address = "${var.talos_cp_01_ip_addr}/24"
    #     gateway = var.default_gateway
    #   }
    #   ipv6 {
    #     address = "dhcp"
    #   }
    # }
  }
}

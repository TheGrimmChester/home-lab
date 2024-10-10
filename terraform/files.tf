locals {
  talos = {
    version = "v1.8.0"
  }
}

resource "proxmox_virtual_environment_download_file" "talos_nocloud_image" {
  content_type            = "iso"
  datastore_id            = "local"
  node_name               = "proxmox"

  file_name               = "talos-${local.talos.version}-nocloud-amd64.iso"
  url                     = "https://factory.talos.dev/image/97bf8e92fc6bba0f03928b859c08295d7615737b29db06a97be51dc63004e403/${local.talos.version}/nocloud-amd64.iso"

  overwrite               = true
}

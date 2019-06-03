provider "google" {
  credentials = "${file("pronto-2dda7f5f08f9.json")}"
  project     = "pronto-242218"
  region      = "asia-southeast1"
  zone        = "asia-southeast1-c"
}


resource "google_compute_instance" "tf_instance" {
  name         = "hitme-${count.index}"
  machine_type = "n1-standard-1"
  count        =  1

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20190530"
      size = 30
    }
  }

  metadata = {
    sshKeys = "kaotu:${file("kaotukey.pub")}"
  }

  network_interface {
    network = "default"
    access_config  {}
  }

  tags = ["http-server"]
}

  output "ip" {
    value = "${google_compute_instance.tf_instance.*.network_interface.0.access_config.0.nat_ip}"
  }


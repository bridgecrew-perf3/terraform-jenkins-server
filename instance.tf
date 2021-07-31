resource "google_compute_instance" "main" {
  name         = var.instance_name
  machine_type = var.instance_machine_type
  zone         = var.instance_zone

  boot_disk {
    initialize_params {
      image = var.instance_image
    }
  }

  network_interface {
		network = "default"
    access_config {
    }
  }
  metadata_startup_script = var.startup_script
  metadata = {
      ssh-keys = "ragheb_benhammouda_equalios:${file("id_rsa.pub")}"	
      }
  service_account {
    scopes = ["storage-rw"]
  }

  allow_stopping_for_update = true

    provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }
      provisioner "file" {
    source      = "/home/ragheb/Downloads/jenkins-cli.jar"
    destination = "/tmp/jenkins-cli.jar"
  }
        provisioner "file" {
    source      = "credentials.json"
    destination = "/home/ragheb_benhammouda_equalios/credentials.json"
  }
  connection {
		type = "ssh"
		user = "ragheb_benhammouda_equalios"
		host = google_compute_instance.main.network_interface.0.access_config.0.nat_ip
		private_key = file("id_rsa")
	}

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/bootstrap.sh",
      " sudo sh -x  /tmp/bootstrap.sh"
    ]
  }
}

# resource "google_compute_firewall" "default" {
#   name    = "allow-jenkins"
#   network = "default"
#   source_ranges = var.source_ranges
#   allow {
#     protocol = "tcp"
#     ports    = ["8080"]
#   }
# }

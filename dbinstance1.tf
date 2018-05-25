resource "google_compute_instance" "default1" {
  name         = "ximble-db2"
  machine_type = "n1-standard-1"
  zone         = "us-central1-f"


  boot_disk {
    initialize_params {
      type = "pd-ssd"
      size = "50"
      image = "db2-image"
    }
  }

  // Local SSD disk
  scratch_disk {
  }
  
  network_interface {
    subnetwork = "${google_compute_subnetwork.ximble-subnet.self_link}"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

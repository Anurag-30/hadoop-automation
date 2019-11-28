resource "google_compute_instance" "slave" {
  count = 3
  name         = "hadoop-slave-${count.index+1}"
  
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"


boot_disk {
    initialize_params {
      image = "centos-8-v20191121"
      size="10"
    }
    
    
}

  tags = [
    "default-allow-ssh",
    "default-allow-internal"
  ]



  network_interface {
    network = "default"

    
  }

  
  metadata_startup_script = "sudo yum install java-1.8.0-openjdk"

  
}

resource "google_compute_instance" "master" {

  name         = "hadoop-master"
  
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"



  tags = [
    "default-allow-ssh",
    "default-allow-internal"
  ]

boot_disk {
    initialize_params {
      image = "centos-8-v20191121"
      size=10
    }
    
    
}

  network_interface {
    network = "default"

    

  metadata_startup_script = "sudo yum install java-1.8.0-openjdk"

  
}
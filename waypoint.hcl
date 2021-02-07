project = "demo-waypoint"

app "helloworld" {
    build {
        use "pack" {
            builder="gcr.io/buildpacks/builder:v1"
        }
        registry {
          use "docker" {
            image = "suman/helloworld-go"
            tag   = "latest"
            local = false
        }
      }
    }
  deploy {
    use "kubernetes" {
    probe_path = "/"
    service_port = 8080
    }
  }

  release {
    use "kubernetes" {
    load_balancer = true
    port = 8080
    }
  }
 }

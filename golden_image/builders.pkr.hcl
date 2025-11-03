build {
  name = "rhel-aws"
  sources = [
    "source.amazon-ebs.base",
  ]

  provisioner "shell" {
    inline = [
      "touch /tmp/hello",
      "sleep 30",
      "ls /tmp/hello",
    ]
  }
}
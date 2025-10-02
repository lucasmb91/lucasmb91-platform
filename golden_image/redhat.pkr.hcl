source "azure-arm" "rhel9" {
    #configuration block to deploying in azure sandbox
    client_id                         = "${var.azure_client_id}"
    client_secret                     = "${var.azure_client_secret}"
    tenant_id                         = "${var.azure_tenant_id}"
    subscription_id                   = "${var.azure_subscription_id}"
    image_offer                       = "RHEL"
    image_publisher                   = "RedHat"
    image_sku                         = "9-lvm-gen2"
    image_version                     = "latest"
    managed_image_name                = "redhat-9"
    location                          = "${var.azure_region}"
    managed_image_resource_group_name = "resourcegroup"
    os_type                           = "linux"
    vm_size                           = "${var.azure_instance_type}"
    shared_image_gallery_destination {
        gallery_name        = "SharedImageGallery"
        image_name          = "rhel9"
        image_version       = "${local.azure_version_number}"
        replication_regions = ["${var.azure_region}"]
        resource_group      = "resourcegroup"
    }
    azure_tags = {
        vm_name = "rhel9"
    }
}

build {
    sources = ["source.azure-arm.rhel9"]

    provisioner "shell" {
        inline = ["cat /etc/os-release"]
    }

    #nesse exemplo o post-baseline-template eh rodado de forma local, para isso tem que se pensar a localizacao do playbook na pipeline
    provisioner "ansible" {
        playbook_file = "playbooks/meu_playbook.yml"
        extra_arguments = [
            "--extra-vars", "var1=valor1"
        ]
    }

    #nesse exemplo, ele faz uma chamada via API para executar um template ja existente no AAP
    provisioner "shell-local" {
        inline = [
            "JOB_ID=$(curl -s -k -X POST https://aap.exemplo.com/api/v2/job_templates/42/launch/ \
                -H 'Content-Type: application/json' \
                -u 'usuario:senha' \
                -d '{}' | jq -r '.id')",

                "echo 'Job ID: $JOB_ID'",
            "STATUS='running'",
            "while [ \"$STATUS\" == \"running\" ] || [ \"$STATUS\" == \"pending\" ]; do \
                sleep 5; \
                STATUS=$(curl -s -k https://aap.exemplo.com/api/v2/jobs/$JOB_ID/ \
                    -u 'usuario:senha' | jq -r '.status'); \
                echo \"Status atual: $STATUS\"; \
            done",
            "if [ \"$STATUS\" != \"successful\" ]; then \
                echo \"Job falhou com status: $STATUS\"; \
                exit 1; \
            fi",
            "echo 'Job no AAP finalizado com sucesso!'"
        ]
    }
}
include $(CONFIG)

DOCKER_IMAGE = $(LOCATION)-docker.pkg.dev/$(PROJECT)/$(DOCKER_REPO)/$(NAME)


.PHONY: hello
hello:
	echo $(DOCKER_IMAGE)

.PHONY: terraform-tfvars
terraform-tfvars:
	echo $(PROJECT)
	touch terraform/terraform.tfvars
	echo hello > terraform/terraform.tfvars
	echo project = \"$(PROJECT)\" > terraform/terraform.tfvars
	echo name = \"$(NAME)\" >> terraform/terraform.tfvars
	echo domain = \"$(DOMAIN)\" >> terraform/terraform.tfvars
	echo location = \"$(LOCATION)\" >> terraform/terraform.tfvars
	echo email = \"$(EMAIL)\" >> terraform/terraform.tfvars
	echo oauth2_client_id = \"$(OAUTH2_CLIENT_ID)\" >> terraform/terraform.tfvars
	echo oauth2_client_secret = \"$(OAUTH2_CLIENT_SECRET)\" >> terraform/terraform.tfvars
	echo github_repository = \"$(GITHUB_REPOSITORY)\" >> terraform/terraform.tfvars


.PHONY: terraform-apply
terraform-apply: terraform-tfvars
	cd terraform && terraform apply

.PHONY: docker-build
docker-build:
	docker build -t $(DOCKER_IMAGE) .

.PHONY: docker-run
docker-run:
	docker run --rm -it -p 80:80 $(DOCKER_IMAGE)

.PHONY: cloud-build
cloud-build:
	gcloud builds submit --tag $(DOCKER_IMAGE)

.PHONY: cloud-run
cloud-run:
	gcloud run deploy $(NAME) \
	  --image $(DOCKER_IMAGE) \
	  --region $(LOCATION) \
	  --ingress internal-and-cloud-load-balancing \
	  --port 80 

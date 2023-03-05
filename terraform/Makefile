format:
	terraform fmt -recursive

init-iam: 
	cd iam && terraform init

plan-iam: 
	cd iam && terraform plan -var-file='variables.tfvars'

apply-iam: 
	cd iam && terraform apply -var-file='variables.tfvars'
	
destroy-iam:
	cd iam && terraform destroy -var-file='variables.tfvars'

init-lambda: 
	cd lambda && terraform init

plan-lambda: 
	cd lambda && terraform plan -var-file='variables.tfvars'

apply-lambda: 
	cd lambda && terraform apply -var-file='variables.tfvars'

destroy-lambda:
	cd lambda && terraform destroy -var-file='variables.tfvars'

init-api-gateway: 
	cd api-gateway && terraform init

plan-api-gateway: 
	cd api-gateway && terraform plan -var-file='variables.tfvars'

apply-api-gateway: 
	cd api-gateway && terraform apply -var-file='variables.tfvars'

destroy-api-gateway:
	cd api-gateway && terraform destroy -var-file='variables.tfvars'

init-all: init-iam init-lambda init-api-gateway

plan-all: plan-iam plan-lambda plan-api-gateway

apply-all: apply-iam apply-lambda apply-api-gateway

destroy-all: destroy-api-gateway destroy-lambda destroy-iam

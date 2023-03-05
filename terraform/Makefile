format:
	terraform fmt -recursive

init-iam: 
	cd iam && terraform init

plan-iam: 
	cd iam && terraform plan 

apply-iam: 
	cd iam && terraform apply
	
destroy-iam:
	cd iam && terraform destroy

init-lambda: 
	cd lambda && terraform init

plan-lambda: 
	cd lambda && terraform plan

apply-lambda: 
	cd lambda && terraform apply 

destroy-lambda:
	cd lambda && terraform destroy 

init-api-gateway: 
	cd api-gateway && terraform init

plan-api-gateway: 
	cd api-gateway && terraform plan 

apply-api-gateway: 
	cd api-gateway && terraform apply 

destroy-api-gateway:
	cd api-gateway && terraform destroy 

init-all: init-iam init-lambda init-api-gateway

plan-all: plan-iam plan-lambda plan-api-gateway

apply-all: apply-iam apply-lambda apply-api-gateway

destroy-all: destroy-api-gateway destroy-lambda destroy-iam

TF_DIRS = $(patsubst %/main.tf, %, $(shell find . -type d -name .terraform -prune -o -name 'main.tf' -print))
VALIDATE_TF_DIRS = $(addprefix validate-,$(TF_DIRS))

# Format all terraform files
fmt:
	terraform fmt -recursive

# Check if all terraform files are formatted
fmt-check:
	terraform fmt -recursive -check

# Validate a terraform directories
$(VALIDATE_TF_DIRS): validate-%:
	@echo "Validate $*"
	terraform -chdir="$*" init -upgrade
	terraform -chdir="$*" validate

# Validate all terraform directories
validate: $(VALIDATE_TF_DIRS)
	@echo "All validated"

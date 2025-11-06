PROTO_DIR=proto
GEN_DIR=gen

generate:
	rm -rf $(GEN_DIR)/*
	
	protoc --proto_path=./services \
		--go_out=./gen \
		--go-grpc_out=./gen \
		./services/auth/*.proto \
		./services/user/*.proto \
		./services/content/*.proto
	
	@echo "Proto files generated successfully!"

validate:
	@echo "Validating proto files..."
	protoc --proto_path=./services \
		--validate_out="lang=go:./gen" \
		./services/auth/*.proto \
		./services/user/*.proto \
		./services/content/*.proto
	@echo "✓ Validation completed"

help:
	@echo "Available targets:"
	@echo "  generate  - Generate proto code"
	@echo "  validate  - Validate proto files"
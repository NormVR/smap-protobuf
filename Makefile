PROTO_DIR=proto
GEN_DIR=gen

proto-gen:
	rm -rf $(GEN_DIR)/*
	
	protoc -I=$(PROTO_DIR) \
		--go_out=$(GEN_DIR) --go_opt=paths=source_relative \
		--go-grpc_out=$(GEN_DIR) --go-grpc_opt=paths=source_relative \
		$(PROTO_DIR)/auth_service.proto $(PROTO_DIR)/auth_service.proto
	
	@echo "Proto files generated successfully!"
TAG ?= 4.3.7
MARKETPLACE_TOOLS_TAG ?= 0.10.18

$(info ---- TAG = $(TAG))

DEPLOYER_IMAGE ?= $(REGISTRY)/minio/deployer:$(TAG)

TESTER_IMAGE ?= $(REGISTRY)/minio/tester:$(TAG)

build/deployer:
	docker build \
		--build-arg REGISTRY="$(REGISTRY)/minio" \
		--build-arg TAG="$(TAG)" \
		--build-arg MARKETPLACE_TOOLS_TAG="$(MARKETPLACE_TOOLS_TAG)" \
		--tag "$(DEPLOYER_IMAGE)" \
		-f deployer/Dockerfile \
		.

	docker push "$(DEPLOYER_IMAGE)"

build/tester:
	$(call print_target,$@)
	cd apptest/tester \
		&& docker build --tag "$(TESTER_IMAGE)" .
	docker push "$(TESTER_IMAGE)"

deployer/verify:
	mpdev verify --deployer="$(DEPLOYER_IMAGE)"

# ensures that the rule contents don't ger printed to stdout
.SILENT:

SEPOLIA_RPC_URL := $(shell grep "^SEPOLIA_RPC_URL=" .env | cut -d '=' -f 2-)

anvil-sepolia-fork ::
	anvil \
	--fork-url="${SEPOLIA_RPC_URL}" \
	--fork-block-number=4094014 \
	--chain-id=11155111 \
	--host 0.0.0.0 \
	--no-rate-limit \
	--auto-impersonate \
	--steps-tracing

test ::
	poetry run ape test --network ethereum:sepolia_fork:foundry

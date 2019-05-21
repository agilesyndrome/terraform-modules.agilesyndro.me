tag:
	. ./.env
	git tag -a v${TF_VAR_VERSION} -m "Created v${TF_VAR_VERSION}"
	git push

PHONY: tag

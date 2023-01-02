pkgupdates := $(shell ./xbps-src show-local-updates)

show:
	@echo ${pkgupdates}
update:
	@./xbps-src bootstrap-update
	@xbulk ${pkgupdates}
	@echo
	@echo "	updated pkgs: ${pkgupdates}"
	@echo
repo_update:
	git pull --rebase upstream master
add_upstream:
	git remote add upstream https://github.com/void-linux/void-packages.git

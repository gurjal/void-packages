pkgupdates := $(shell ./xbps-src show-local-updates)

show:
	@echo ${pkgupdates}
sync:
	git pull --rebase upstream master
	@./xbps-src bootstrap-update
update:
	@./xbps-src bootstrap-update
	@xbulk ${pkgupdates}
	@echo
	@echo "	updated pkgs: ${pkgupdates}"
	@echo
save:
	git push -fu origin master
setupstream:
	git remote add upstream https://github.com/void-linux/void-packages.git

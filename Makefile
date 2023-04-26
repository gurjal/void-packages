pkgupdates := $(shell ./xbps-src show-local-updates)

show:
	@echo "current available updates:\n${pkgupdates}"
sync:
	git pull --rebase upstream master
	@./xbps-src bootstrap-update
update:
	@./xbps-src bootstrap-update
	@xbulk ${pkgupdates}
	@echo
	@echo "	updated pkgs: ${pkgupdates}"
	@echo
pushbranch:
	git push -fu origin master
setupstream:
	git remote add upstream https://github.com/void-linux/void-packages.git
help:
	@echo "usage:"
	@echo "    show           show available updates for local repo packages"
	@echo "    sync           pull upstream repo and update bootstrapped packages"
	@echo "    update         update installed and bootstrapped local repo packages"
	@echo "    pushbranch     force push personal repo"
	@echo "    setupstream    set remote 'uptream' to official void-packages repo"
	@echo "    help"

pkgupgrades := $(shell ./xbps-src show-local-updates)

help:
	@echo "usage:"
	@echo "    list           list and show available upgrades for source packages"
	@echo "    sync           pull upstream repo and upgrade bootstrapped packages"
	@echo "    upgrade        upgrade source packages"
	@echo "    pushmyrepo     force push personal repo"
	@echo "    setupstream    set remote 'uptream' url to official void-packages repo"
	@echo "    help"
list:
	@xpkg -mL | grep ':'
	@echo "current available upgrades:\n${pkgupgrades}"
sync:
	git pull --rebase upstream master
upgrade:
	@./xbps-src bootstrap-update
	@xbulk ${pkgupgrades}
	@echo
	@echo "	upgraded pkgs: ${pkgupgrades}"
	@echo
pushmyrepo:
	git push -fu origin master
setupstream:
	git remote add upstream https://github.com/void-linux/void-packages.git

pkgupdates := $(shell ./xbps-src show-local-updates)

show:
	@echo ${pkgupdates}
update:
	@xbulk ${pkgupdates}
repo_update:
	git pull --rebase upstream master
add_upstream:
	git remote add upstream https://github.com/void-linux/void-packages.git

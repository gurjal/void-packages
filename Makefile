pkgupdates := $(shell ./xbps-src show-local-updates)

show:
	@echo ${pkgupdates}
update:
	@xbulk ${pkgupdates}
repo_update:
	git pull --rebase upstream master

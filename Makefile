.PHONY: plugin
plugin:
	rm -f plugin.zip
	zip -r plugin.zip . --exclude "*.DS_Store" --exclude "plugin.zip" --exclude ".git/*" --exclude "Makefile" --exclude ".claude/*"

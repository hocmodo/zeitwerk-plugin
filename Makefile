.PHONY: plugin
plugin:
	rm -f plugin.zip
	zip -r plugin.zip . --exclude "*.DS_Store" --exclude "mcp-server/*" --exclude "plugin.zip" --exclude ".git/*" --exclude "Makefile" --exclude ".claude/*"

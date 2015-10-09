.PHONY: config
config:
	@cp scripts/emacs-terminal-for-el-capitan.sh /usr/local/bin/em
	@chmod +x /usr/local/bin/em
	@echo "alias emacs=em" >> ~/.zshrc
	@echo "Run 'source ~/.zshrc'"


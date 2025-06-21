################################################################################
## FILES AND FOLDERS ###########################################################
################################################################################

ZSH_SRC		:= $(wildcard $(CURDIR)/zsh/*)
ZSH_DST		:= $(ZSH_SRC:$(CURDIR)/zsh/%.sh=$(HOME)/.%)

TMUX_SRC	:= $(wildcard $(CURDIR)/tmux/*)
TMUX_DST	:= $(TMUX_SRC:$(CURDIR)/tmux/%=$(HOME)/.%)

################################################################################
## INSTALL TARGETS #############################################################
################################################################################

.PHONY: install
install: install-zsh install-tmux

.PHONY: install-zsh
install-zsh: $(ZSH_DST)
$(ZSH_DST): $(HOME)/.%: $(CURDIR)/zsh/%.sh
	cp $< $@

.PHONY: install-tmux
install-tmux: $(TMUX_DST)
$(TMUX_DST): $(HOME)/.%: $(CURDIR)/tmux/%
	cp $< $@

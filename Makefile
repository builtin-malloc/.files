################################################################################
## FILES AND FOLDERS ###########################################################
################################################################################

ZSH_SRC		:= $(wildcard $(CURDIR)/zsh/*)
ZSH_DST		:= $(ZSH_SRC:$(CURDIR)/zsh/%.sh=$(HOME)/.%)

TMUX_SRC	:= $(wildcard $(CURDIR)/tmux/*)
TMUX_DST	:= $(TMUX_SRC:$(CURDIR)/tmux/%=$(HOME)/.%)

NVIM_SRC	:= $(wildcard $(CURDIR)/nvim/*.lua $(CURDIR)/nvim/lua/*.lua)
NVIM_DST	:= $(NVIM_SRC:$(CURDIR)/%=$(HOME)/.config/%)

################################################################################
## INSTALL TARGETS #############################################################
################################################################################

.PHONY: install
install: install-zsh install-tmux install-nvim

.PHONY: install-zsh
install-zsh: $(ZSH_DST)
$(ZSH_DST): $(HOME)/.%: $(CURDIR)/zsh/%.sh
	cp $< $@

.PHONY: install-tmux
install-tmux: $(TMUX_DST)
$(TMUX_DST): $(HOME)/.%: $(CURDIR)/tmux/%
	cp $< $@

.PHONY: install-nvim
install-nvim: $(NVIM_DST)
$(NVIM_DST): $(HOME)/.config/%: $(CURDIR)/% | $(HOME)/.config/nvim/lua
	cp $< $@
$(HOME)/.config/nvim/lua:
	mkdir -p $@

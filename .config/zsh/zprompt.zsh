#!/usr/bin/sh
DISABLE_UNTRACKED_FILES_DIRTY="false"
ZSH_THEME_GIT_PROMPT_PREFIX=" "         
ZSH_THEME_GIT_PROMPT_SUFFIX=""             
ZSH_THEME_GIT_PROMPT_DIRTY=" [%F{red}!%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{red}?%f]"
ZSH_THEME_GIT_PROMPT_ADDED="%F{green}✚%f]"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{red}!%f]"
ZSH_THEME_GIT_PROMPT_RENAMED="%F{orange}»%f]"
ZSH_THEME_GIT_PROMPT_DELETED="%F{red}✘%f]"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{cyan}§%f]"
ZSH_THEME_GIT_PROMPT_AHEAD="%F{blue}⇡%f]"
ZSH_THEME_GIT_PROMPT_BEHIND="%F{blue}⇣%f]"
ZSH_THEME_GIT_PROMPT_DIVERGED="⇕]"
ZSH_THEME_GIT_PROMPT_STASHED="%F{green}$%f]"

PROMPT='%B%F{magenta}%c%f$(git_prompt_info) »%b '

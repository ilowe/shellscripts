function dirhooks() {
    if [ -f Dockerfile ]; then require docker; else unload docker; fi;
    if [ -d .git ]; then require git; else unload git; fi
}

function _dirhooks_unload() {
	unset -f dirhooks
}

export PROMPT_COMMAND=dirhooks
# For other shells, maybe? Like zsh.. 
export chpwd=dirhooks

dirhooks
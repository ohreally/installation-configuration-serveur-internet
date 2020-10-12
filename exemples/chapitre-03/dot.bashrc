################################################################################
#
# Configuration Bash pour les shells interactifs.
#
# ~/.bashrc
#
# Plus d'infos : https://www.librobert.net/livre/internet
#
################################################################################
#
# Copyright (c) 2019 Robert LA LAU < https://www.librobert.net/ >
#
# Cette œuvre est mise à disposition sous licence Attribution 4.0 International.
# Pour voir une copie de cette licence, visitez http://creativecommons.org/licenses/by/4.0/
# ou écrivez à Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
#
################################################################################
#
# Enregistrez ce fichier sous le nom .bashrc dans le répertoire personnel de tous les utilisateurs
# et de toutes les utilisatrices, ou fusionnez-les si un fichier de tel nom existe déjà.
#
# Enregistrez ce ficher également sous /usr/share/skel/dot.bashrc (FreeBSD)
# ou /etc/skel/.bashrc (Linux), ou fusionnez-les.
#
# Voir bash(1) pour la documentation.
#
################################################################################

# Ne rien faire si ce n'est pas un shell interactive.
[ -z "${-//[^i]/}" ] && return

# Pour rendre un peu plus conviviale le shell.
shopt -s histappend checkwinsize
export FIGNORE='.bak:~'
export HISTCONTROL=ignoreboth
export LC_COLLATE=C

# C'est pratique d'avoir un répertoire personnel pour les scripts.
[ -d "${HOME}/bin" ] && export PATH="${HOME}/bin:${PATH}"

# Application par défaut pour lire les fichiers texte.
if [ -x `which less`]; then
	export PAGER=less
else 
	export PAGER=more
fi

# Application par défaut pour la modification des fichiers texte.
if [ -x `which nano` ]; then
	export EDITOR=nano
else
	export EDITOR=vi
fi

# Alias de commandes.
alias ll='ls -lF'
alias lsl='ls -laF'
alias lsc='ls -1 | wc -l | sed -e "s/[[:blank:]]//g"'
alias lsca='ls -A1 | wc -l | sed -e "s/[[:blank:]]//g"'
#alias ls='ls -F'

# Modifier l'invite de commande et le titre des terminaux X.
# Voir aussi : https://www.howtogeek.com/307701/how-to-customize-and-colorize-your-bash-prompt/
if [ "${PS1}" ]; then

	# Utilisateur/-trice, nom de hôte et chemin dans la barre de titre.
	case ${TERM} in
		xterm*|rxvt*|Eterm|eterm)
			PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
			;;
		screen)
			PROMPT_COMMAND='echo -ne "\033_(screen)${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
			;;
		*)
			;;
	esac

	# Utilisateur/-trice, nom d'hôte et chemin dans l'invite de commande ;
	# l'utilisateur root en couleur.
	if [ "`id -u`" = "0" ]; then
		PS1='\[\033[41m\]\[\033[01;37m\]\u@\h\[\033[00m\]:\w # '
	else
		PS1='\u@\h:\w $ '
	fi
fi

# Exemple d'une fonction.
# Apres avoir chargé ce fichier, tapez la ligne de commande
# 'exemple 1 deux ...' (sans les guillemets).
exemple() {
	premier=$1
	shift
	reste=$@
	echo "La première paramètre était '${premier}'."
	echo "Le reste des paramètres était '${reste}'."
}

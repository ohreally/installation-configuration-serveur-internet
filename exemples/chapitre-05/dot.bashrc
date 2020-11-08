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
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
#    this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its contributors
#    may be used to endorse or promote products derived from this software
#    without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
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

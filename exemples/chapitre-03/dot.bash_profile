################################################################################
#
# Configuration Bash pour les shells de login interactifs.
#
# ~/.bash_profile
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
# Enregistrez ce fichier sous le nom .bash_profile dans le répertoire personnel de tous les utilisateurs
# et de toutes les utilisatrices, ou fusionnez-les si un fichier de tel nom existe déjà.
#
# Enregistrez ce ficher également sous /usr/share/skel/dot.bash_profile (FreeBSD)
# ou /etc/skel/.bash_profile (Linux), ou fusionnez-les.
#
# Voir bash(1) pour la documentation.
#
################################################################################

# Charger ~/.bashrc, si ce fichier existe.
[ -f "${HOME}/.bashrc" ] && source "${HOME}/.bashrc"

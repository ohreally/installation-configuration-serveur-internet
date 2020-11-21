# Errata pour *Installation et configuration d'un serveur internet*

---

**Page 77** : Le démarrage de *lynx*.

![Non](images/non.png) <code>**freebsd#** lynx [&hellip;]</code>

![Oui](images/oui.png) <code>**freebsd$** lynx [&hellip;]</code>

> *lynx* peut être exécuté par les utilisateurs normaux.

> &rarr; 2x

---

**Page 83** : Le démarrage de *lynx*.

![Non](images/non.png) <code>**debian#** lynx [&hellip;]</code>

![Oui](images/oui.png) <code>**debian$** lynx [&hellip;]</code>

> *lynx* peut être exécuté par les utilisateurs normaux.

> &rarr; 2x

---

**Page 89** : Le démarrage de *lynx*.

![Non](images/non.png) <code>**debian#** lynx [&hellip;]</code>

![Oui](images/oui.png) <code>**centos$** lynx [&hellip;]</code>

> L'invite de commande doit être une invite CentOS pour les utilisateurs normaux.

> &rarr; 2x

---

**Page 193** : La configuration du daemon *sshd*.

![Non](images/non.png) <code>StrictMode yes</code>

![Oui](images/oui.png) <code>StrictMode**s** yes</code>

---

**Page 220** : La recherche des modules Apache sous FreeBSD.

![Non](images/non.png) <code>freebsd# pkg **src** mod_</code>

![Oui](images/oui.png) <code>freebsd# pkg **search** mod_</code>

---

**Page 248** : Le répertoire <code>alias</code> pour un hôte ou serveur virtuel.

![Non](images/non.png) Apache appelle une telle séparation un *alias*, sous Nginx c'est une *location*

![Oui](images/oui.png) une telle séparation s'appelle un *alias* sous Apache et Nginx

> L'alias est défini dans un contexte *location* sous Nginx&nbsp; cf. page 382&nbsp;: chapitre *Serveur web - Avancé*, section *Alias*.

---

**Page 250** : La création des répertoires pour le premier hôte virtuel.

![Non](images/non.png) <code># chown -R **webdev**:**webdev** vert.example.com</code>

![Oui](images/oui.png) <code># chown -R **devweb**:**devweb** vert.example.com</code>

---

**Page 275** : Les ACL par défaut sous FreeBSD.

![Non](images/non.png)\
<code>freebsd# setfacl -m user:www:rx .</code>\
<code>freebsd# setfacl -d -m user:www:rx .</code>

![Oui](images/oui.png)\
<code>freebsd# setfacl -m user:www:rx .</code>\
<code><strong>freebsd# setfacl -d -m user::rwx,group::rwx,other::\-\-\- .</strong></code>\
<code>freebsd# setfacl -d -m user:www:rx .</code>

> Avant de pouvoir définir les ACL par défaut pour les utilisateurs ou les groupes particuliers, les ACL par défaut générales doivent être définies&nbsp;; cf. page 162&nbsp;: chapitre *Gestion des utilisateurs et des droits*, section *ACL par défaut*.

---

**Page 276** : Les ACL par défaut sous FreeBSD.

![Non](images/non.png)\
<code>bsd# setfacl -d -m user:www-db:rx .</code>\
<code>[&hellip;]</code>\
<code>bsd# setfacl -d -m user:www-db:rwx ./tmp</code>

![Oui](images/oui.png)\
<code><strong>bsd# setfacl -d -m user::rwx,group::rwx,other::\-\-\- .</strong></code>\
<code>bsd# setfacl -d -m user:www-db:rx .</code>\
<code>[&hellip;]</code>\
<code><strong>bsd# setfacl -d -m user::r-x,group::r-x,other::\-\-\- ./tmp</strong></code>\
<code>bsd# setfacl -d -m user:www-db:rwx ./tmp</code>

> Avant de pouvoir définir les ACL par défaut pour les utilisateurs ou des groupes particuliers, les ACL par défaut générales doivent être définies&nbsp;; cf. page 162&nbsp;: chapitre *Gestion des utilisateurs et des droits*, section *ACL par défaut*.

---

**Page 312** : Les fichiers de configuration de phpLDAPadmin sous FreeBSD.

![Non](images/non.png) Les fichiers de configuration [&hellip;] <code>/etc/phpldapadmin</code>.

![Oui](images/oui.png) Les fichiers de configuration [&hellip;] <code>/etc/phpldapadmin</code> (<code>/usr/local/www/phpldapadmin/config</code> sous FreeBSD).

---

**Page 314** : La désactivation du chiffrage TLS pour phpLDAPadmin.

![Non](images/non.png) Le certificat sera utilisé pour crypter la connexion avec les clients de messagerie, quand ils se servent du carnet d'adresses partagé.

![Oui](images/oui.png) Le certificat sera utilisé pour crypter la connection des clients de bureau, comme Apache Directory Studio, avec le serveur.

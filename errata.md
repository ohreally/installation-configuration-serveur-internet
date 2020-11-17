# Errata pour *Installation et configuration d'un serveur internet*

---

**Page 77** : Le démarrage de *lynx* (*lynx* peut être exécuté par les utilisateurs normaux).

![Non](images/non.png) <code>**freebsd#** lynx [&hellip;]</code>

![Oui](images/oui.png) <code>**freebsd$** lynx [&hellip;]</code>

(2x)

---

**Page 83** : Le démarrage de *lynx* (*lynx* peut être exécuté par les utilisateurs normaux).

![Non](images/non.png) <code>**debian#** lynx [&hellip;]</code>

![Oui](images/oui.png) <code>**debian$** lynx [&hellip;]</code>

(2x)

---

**Page 89** : Le démarrage de *lynx* (l'invite de commande).

![Non](images/non.png) <code>**debian#** lynx [&hellip;]</code>

![Oui](images/oui.png) <code>**centos$** lynx [&hellip;]</code>

(2x)

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

(L'alias est défini dans un contexte *location* sous Nginx, cf. page 382 : chapitre *Serveur web - Avancé*, section *Alias*.)

---

**Page 250** : La création des répertoires pour le premier hôte virtuel.

![Non](images/non.png) <code># chown -R **webdev**:**webdev** vert.example.com</code>

![Oui](images/oui.png) <code># chown -R **devweb**:**devweb** vert.example.com</code>

---

**Page 275** : Les ACL par défaut sous FreeBSD.

![Non](images/non.png)<br />
<code>freebsd# setfacl -m user:www:rx .<br />
freebsd# setfacl -d -m user:www:rx .</code>

![Oui](images/oui.png)<br />
<code>freebsd# setfacl -m user:www:rx .<br />
<strong>freebsd# setfacl -d -m user::rwx,group::rwx,other::\-\-\- .</strong><br />
freebsd# setfacl -d -m user:www:rx .</code>

---

**Page 276** : Les ACL par défaut sous FreeBSD.

![Non](images/non.png)<br />
<code>bsd# setfacl -d -m user:www-db:rx .<br />
[&hellip;]<br />
bsd# setfacl -d -m user:www-db:rwx ./tmp</code>

![Oui](images/oui.png)<br />
<code><strong>bsd# setfacl -d -m user::rwx,group::rwx,other::\-\-\- .</strong><br />
bsd# setfacl -d -m user:www-db:rx .<br />
[&hellip;]<br />
<strong>bsd# setfacl -d -m user::r-x,group::r-x,other::\-\-\- ./tmp</strong><br />
bsd# setfacl -d -m user:www-db:rwx ./tmp</code>

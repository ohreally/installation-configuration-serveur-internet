# Errata pour *Installation et configuration d'un serveur internet*

---

**Page 193** : La configuration du daemon *sshd*.

![Non](images/non.png) <code>StrictMode yes</code>

![Oui](images/oui.png) <code>StrictMode**s** yes</code>

---

**Page 220** : La recherche des modules Apache sous FreeBSD.

![Non](images/non.png) <code>freebsd# pkg **src** mod_</code>

![Oui](images/oui.png) <code>freebsd# pkg **search** mod_</code>

---

**Page 250** : La création des répertoires pour le premier hôte virtuel.

![Non](images/non.png) <code># chown -R **webdev**:**webdev** vert.example.com</code>

![Oui](images/oui.png) <code># chown -R **devweb**:**devweb** vert.example.com</code>

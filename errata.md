# Errata pour *Installation et configuration d'un serveur internet*

Légende:

![Non](images/non.png) : texte d'origine

![Oui](images/oui.png) : texte corrigé

---

**Page 77** : Le démarrage de *lynx*.

![Non](images/non.png)
<pre>freebsd<strong>#</strong> lynx [&hellip;]</pre>

![Oui](images/oui.png)
<pre>freebsd<strong>$</strong> lynx [&hellip;]</pre>

> *lynx* peut être exécuté par les utilisateurs normaux.

> &rarr; 2x

---

**Page 83** : Le démarrage de *lynx*.

![Non](images/non.png)
<pre>debian<strong>#</strong> lynx [&hellip;]</pre>

![Oui](images/oui.png)
<pre>debian<strong>$</strong> lynx [&hellip;]</pre>

> *lynx* peut être exécuté par les utilisateurs normaux.

> &rarr; 2x

---

**Page 89** : Le démarrage de *lynx*.

![Non](images/non.png)
<pre><strong>debian#</strong> lynx [&hellip;]</pre>

![Oui](images/oui.png)
<pre><strong>centos$</strong> lynx [&hellip;]</pre>

> L'invite de commande doit être une invite CentOS pour les utilisateurs normaux.

> &rarr; 2x

---

**Page 100** : Le redémarrage du service *netif*.

![Non](images/non.png)
<pre>freebsd# service netif restart</pre>

![Oui](images/oui.png)
<pre>freebsd# service netif restart<strong> && service routing restart</strong></pre>

> Le redémarrage de l'interface réseau supprime toutes les routes dans la table de routage&nbsp;; le redémarrage du service *routing* les recrée. Ces deux redémarrages doivent être faits dans une seule commande.

> Si le service *routing* n'est pas redémarré après le redémarrage du service *netif*, le serveur devient inaccessible et doit être redémarré. Clairement cela n'est vrai que si le serveur est géré à distance (p.ex. par SSH).

---

**Page 109/110** : La configuration du pare-feu *pf*.

![Non](images/non.png)
<pre><strong># Tableau pour les adresses IP bloquées automatiquement.
table f2b persist { }</strong>

[&hellip;]

<strong># Bloquer les adresses explicitement bloquées.
block drop quick from &lt;f2b&gt; to any</strong></pre>

![Oui](images/oui.png)
<pre><strong><del># Tableau pour les adresses IP bloquées automatiquement.
table f2b persist { }</del></strong>

[&hellip;]
antispoof for $interface

<strong>anchor "f2b/*"</strong>

# Politiques par défaut.
[&hellip;]

<strong><del># Bloquer les adresses explicitement bloquées.
block drop quick from &lt;f2b&gt; to any</del></strong></pre>

> Les versions les plus récentes de Fail2ban se servent d'une *anchor* (ancre) pour la création automatique des tableaux et règles nécessaires. Cette *anchor* est inséré entre la ligne *antispoof* et la ligne *block in all*&nbsp;; les lignes se référant au tableau *f2b* doivent être supprimées.

---

**Page 193** : La configuration du daemon *sshd*.

![Non](images/non.png)
<pre>StrictMode yes</pre>

![Oui](images/oui.png)
<pre>StrictMode<strong>s</strong> yes</pre>

---

**Page 220** : La recherche des modules Apache sous FreeBSD.

![Non](images/non.png)
<pre>freebsd# pkg <strong>src</strong> mod_</pre>

![Oui](images/oui.png)
<pre>freebsd# pkg <strong>search</strong> mod_</pre>

---

**Page 238** : L'activation de PHP-FPM sous FreeBSD.

![Non](images/non.png)
<pre>freebsd# service <strong>enable php-fpm</strong></pre>

![Oui](images/oui.png)
<pre>freebsd# service <strong>php-fpm enable</strong></pre>

---

**Page 248** : Le répertoire <code>alias</code> pour un hôte ou serveur virtuel.

![Non](images/non.png)\
Apache appelle une telle séparation un *alias*, sous Nginx c'est une *location*

![Oui](images/oui.png)\
une telle séparation s'appelle un *alias* sous Apache et Nginx

> L'alias est défini dans un contexte *location* sous Nginx&nbsp; cf. page 382&nbsp;: chapitre *Serveur web - Avancé*, section *Alias*.

---

**Page 250** : La création des répertoires pour le premier hôte virtuel.

![Non](images/non.png)
<pre># chown -R <strong>webdev</strong>:<strong>webdev</strong> vert.example.com</pre>

![Oui](images/oui.png)
<pre># chown -R <strong>devweb</strong>:<strong>devweb</strong> vert.example.com</pre>

---

**Pages 256/257/258** : Configuration Nginx : contextes *location*.

![Non](images/non.png)
<pre>location / {
  [&hellip;]
}
<strong>location ~ \.php$ {
  [&hellip;]
}</strong></pre>

![Oui](images/oui.png)
<pre>location / {
  [&hellip;]
  <strong>location ~ \.php$ {
    [&hellip;]
  }</strong>
}</pre>

> Le deuxième contexte *location*, pour les fichiers PHP, doit être placé dans le premier contexte *location*.

> &rarr; 3x

---

**Page 275** : Les ACL par défaut sous FreeBSD.

![Non](images/non.png)
<pre>freebsd# setfacl -m user:www:rx .
freebsd# setfacl -d -m user:www:rx .</pre>

![Oui](images/oui.png)
<pre>freebsd# setfacl -m user:www:rx .
<strong>freebsd# setfacl -d -m user::rwx,group::rwx,other::--- .</strong>
freebsd# setfacl -d -m user:www:rx .</pre>

> Avant de pouvoir définir les ACL par défaut pour les utilisateurs ou les groupes particuliers, les ACL par défaut générales doivent être définies&nbsp;; cf. page 162&nbsp;: chapitre *Gestion des utilisateurs et des droits*, section *ACL par défaut*.

---

**Page 276** : Les ACL par défaut sous FreeBSD.

![Non](images/non.png)
<pre>bsd# setfacl -d -m user:www-db:rx .
[&hellip;]
bsd# setfacl -d -m user:www-db:rwx ./tmp</pre>

![Oui](images/oui.png)
<pre><strong>bsd# setfacl -d -m user::rwx,group::rwx,other::--- .</strong>
bsd# setfacl -d -m user:www-db:rx .
[&hellip;]
<strong>bsd# setfacl -d -m user::r-x,group::r-x,other::--- ./tmp</strong>
bsd# setfacl -d -m user:www-db:rwx ./tmp</pre>

> Avant de pouvoir définir les ACL par défaut pour les utilisateurs ou des groupes particuliers, les ACL par défaut générales doivent être définies&nbsp;; cf. page 162&nbsp;: chapitre *Gestion des utilisateurs et des droits*, section *ACL par défaut*.

---

**Page 277/278** : Configuration Nginx *bd.example.com*.

![Non](images/non.png)
<pre><strong>http {</strong>
  server {
    [&hellip;]
  }
  server {
    [&hellip;]
  }
<strong>}</strong></pre>

![Oui](images/oui.png)
<pre>server {
  [&hellip;]
}
server {
  [&hellip;]
}</pre>

> Comme les configurations des serveurs virtuels sont chargé dans le contexte *http* (cf. page 236, Chapitre *Serveur web - Base*, section *Nginx*, *Configuration*), ce fichier ne doit pas contenir un contexte *http*; cette configuration ne contient que 2 contextes *server*.

---

**Page 278** : Configuration Nginx *bd.example.com*.

![Non](images/non.png)
<pre>location / {
  [&hellip;]
}
<strong>location ~ \.php$ {
  [&hellip;]
}</strong></pre>

![Oui](images/oui.png)
<pre>location / {
  [&hellip;]
  <strong>location ~ \.php$ {
    [&hellip;]
  }</strong>
}</pre>

> Le troisième contexte *location*, pour les fichiers PHP, doit être placé dans le deuxième contexte *location*.

---

**Page 286** : Configuration Nginx phpMyAdmin.

![Non](images/non.png)
<pre>location /mariadb {
  alias /usr/local/www/phpMyAdmin;
}</pre>

![Oui](images/oui.png)
<pre>location /mariadb {
  alias /usr/local/www/phpMyAdmin;
  <strong>location ~ \.php$ {
    fastcgi_pass 127.0.0.1:9001;
    fastcgi_index index.php;
    fastcgi_param SCRIPT_FILENAME $request_filename;
    include fastcgi_params;
  }</strong>
}</pre>

> Les directives pour PHP-FPM sont perdues.

---

**Page 294** : Configuration Nginx phpPgAdmin.

![Non](images/non.png)
<pre>location /postgres {
  alias /usr/local/www/phpPgAdmin;
}</pre>

![Oui](images/oui.png)
<pre>location /postgres {
  alias /usr/local/www/phpPgAdmin;
  <strong>location ~ \.php$ {
    fastcgi_pass 127.0.0.1:9001;
    fastcgi_index index.php;
    fastcgi_param SCRIPT_FILENAME $request_filename;
    include fastcgi_params;
  }</strong>
}</pre>

> Les directives pour PHP-FPM sont perdues.

---

**Page 311** : Configuration Nginx phpLDAPadmin.

![Non](images/non.png)
<pre>location /ldap {
  alias /usr/local/www/phpldapadmin/htdocs;
}</pre>

![Oui](images/oui.png)
<pre>location /ldap {
  alias /usr/local/www/phpldapadmin/htdocs;
  <strong>location ~ \.php$ {
    fastcgi_pass 127.0.0.1:9001;
    fastcgi_index index.php;
    fastcgi_param SCRIPT_FILENAME $request_filename;
    include fastcgi_params;
  }</strong>
}</pre>

> Les directives pour PHP-FPM sont perdues.

---

**Page 312** : Les fichiers de configuration de phpLDAPadmin sous FreeBSD.

![Non](images/non.png)\
Les fichiers de configuration [&hellip;] <code>/etc/phpldapadmin</code>.

![Oui](images/oui.png)\
Les fichiers de configuration [&hellip;] <code>/etc/phpldapadmin</code> **(<code>/usr/local/www/phpldapadmin/config</code> sous FreeBSD)**.

---

**Page 314** : La désactivation du chiffrage TLS pour phpLDAPadmin.

![Non](images/non.png)\
Le certificat sera utilisé pour crypter la connexion avec les clients de messagerie, quand ils se servent du carnet d'adresses partagé.

![Oui](images/oui.png)\
Le certificat sera utilisé pour crypter la connection des clients de bureau, comme Apache Directory Studio, avec le serveur. Le certificat TLS de *bd.example.com* chiffra la communication entre l'utilisateur et phpLDAPadmin.

---

**Page 342** : Fichier de configuration Postfix *master.cf*.

![Non](images/non.png)\
Dans le fichier <code>master.**conf**</code>, [&hellip;]

![Oui](images/oui.png)\
Dans le fichier <code>master.**cf**</code>, [&hellip;]

> Ce fichier s'appelle *master.cf*, comme indiqué quelques lignes plus haut.

---

**Page 395** : Configuration Nginx WebDAV.

![Non](images/non.png)
<pre><strong>http {</strong>
  server {
    [&hellip;]
  }
  server {
    [&hellip;]
  }
<strong>}</strong></pre>

![Oui](images/oui.png)
<pre>server {
  [&hellip;]
}
server {
  [&hellip;]
}</pre>

> Comme les configurations des serveurs virtuels sont chargé dans le contexte *http* (cf. page 236, Chapitre *Serveur web - Base*, section *Nginx*, *Configuration*), ce fichier ne doit pas contenir un contexte *http*; cette configuration ne contient que 2 contextes *server*.

---

**Page 402/403** : Configuration Nginx Radicale.

![Non](images/non.png)
<pre><strong>http {</strong>
  server {
    [&hellip;]
  }
  server {
    [&hellip;]
  }
<strong>}</strong></pre>

![Oui](images/oui.png)
<pre>server {
  [&hellip;]
}
server {
  [&hellip;]
}</pre>

> Comme les configurations des serveurs virtuels sont chargé dans le contexte *http* (cf. page 236, Chapitre *Serveur web - Base*, section *Nginx*, *Configuration*), ce fichier ne doit pas contenir un contexte *http*; cette configuration ne contient que 2 contextes *server*.

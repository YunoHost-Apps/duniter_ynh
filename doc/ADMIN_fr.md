## Première synchronisation

La première synchronisation pouvant demander beaucoup de temps, il peut être envisagé de la faire en ligne de commande par ssh plutôt que par l'interface web.
Afin de pouvoir laisser la synchronisation se faire sans garder la fenêtre du terminal ouverte connecté en ssh, il est recommandé d'utiliser `tmux` ou `screen`:

* `screen -S duniter` afin d'ouvrir un nouvel "écran" ; Dans cet écran appelez "duniter" :

```bash
sudo systemctl stop duniter
sudo su - duniter -c "duniter --home \$HOME sync g1.duniter.org" && sudo systemctl start duniter
```

Pendant la synchronisation, vous pouvez faire `CTRL+SHIFT+a,d` afin de quitter sans fermer l'écran "duniter", vous pouvez alors quitter la connexion ssh.
Pour revenir à votre écran "duniter" pour voir si la synchro est terminée, vous devez lancer la commande `screen -d duniter`.

## Configuration

- Afin de calculer des blocs, il faut configurer ses identifiants membre avec `sudo su - duniter -c "duniter --home \$HOME wizard key"` ou via l’interface d’administration web.
- BMA, l’API client est accessible via `https://duniter.domain.tld/bma/` si activé. Le dernier `/` est nécessaire à son fonctionnement. Cette URL peut être utilisée dans Cesium et Silkaj.
- L’interface d’administration web est accessible à l’adresse `https://duniter.domain.tld/` et est uniquement accessible à l’administrateur spécifié lors de l’installation.
- **Attention** : dans le cas où l’interface d’administration web vous notifie que votre configuration réseau est incorrecte et propose de la corriger, ne le faites pas, autrement ça cassera la configuration spécifique au bon fonctionnement de ce paquet.
Dans le cas où vous auriez appliqué cette correction, vous pouvez manuellement remettre en place la configuration avec la commande suivante :
`sudo su - duniter -c "duniter --home \$HOME config --bma --ipv4 127.0.0.1 --port CHOSEN_PORT --remoteh YOUR_DOMAIN --remotep 443 --noupnp"`

## Cesium

Cesium est une application portefeuilles web. Vous pouvez l’installer [avec l’application YunoHost](https://github.com/YunoHost-Apps/cesium_ynh).

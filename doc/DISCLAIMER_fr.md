## Première synchronisation
La première synchronisation pouvant demander beaucoup de temps, il peut être envisagé de la faire en ligne de commande par ssh plutôt que par l'interface graphique WEB. Afin de pouvoir laisser la synchronisation se faire sans garder la fenêtre du terminal ouverte connecté en ssh, il est recommandé d'utiliser `tmux` ou `screen`.
`screen -S duniter` afin d'ouvrir un nouvel "écran".
Dans cet écran appelé "duniter" :
```
sudo systemctl stop duniter
sudo su - duniter -c "duniter --home \$HOME sync g1.duniter.org" && sudo systemctl start duniter
```
Pendant la synchronisation, vous pouvez faire CTRL+SHIFT+a+d afin de quitter sans fermer l'écran "duniter", vous pouvez alors quitter la connexion ssh.
Pour revenir à votre écran "duniter" pour voir si la synchro est terminée, vous devez lancer la commande
`screen -d duniter`

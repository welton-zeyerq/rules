# rules
anonymize kali server with iptables


tutorial no video:

https://youtu.be/9IhNvCzexxE


comandos uteis:

tcpdump -nSai any -s 0 -vvv | grep UDP

use . torsocks off antes

_

nenhuma conexao fora do torsocks passa, logo se desabilitar torsocks, lembre de ativar novamente

tpc only. tudo que nao for tcp sera negado.

nada fora da rede onion passa.

_

use nyx para visualizar de maneira grafica a conexao .onion

para saber seu ip, use:  curl https://api.ipify.org

_

qualquer link .onion abre normalmente

_

se encontrar erros, ficaria grato se puder reportar

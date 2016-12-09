# Receitas para configuração de um cluster Hadoop

Esse repositório contm uma série de receitas que podem ser utilizadas para a
configuração de um cluster Hadoop. O [chake](https://github.com/terceiro/chake) é
usado para rodar a receita em todas as máquinas do cluster, sem a necessidade do
chef-server.

## Antes de executar a receita

É necessrio que a infraestrutura de máquinas já exista, isto é, que todas as máquinas
a serem usadas no clsuter já tenham sido criadas, e contenham a configuração básica de
um sistema Linux.

Esse repositório também contém um Vagrantfile que pode ser usado com o vagrant para
criar um número arbitrário de máquinas Debian. Edite o arquivo `config/config.yaml` para
alterar o número de máquinas do cluster, e o formato que será usado para os endereços de IP.
Por exemplo, a configuração abaixo cria um cluster com 3 máquinas na rede 192.168.1.0.

```
num_of_masters: 1
num_of_slaves: 2
ip_format: "192.168.1.%s"
```

## Executando a receita

A receita deve ser executada a partir de uma máquina que tenha acesso SSH sobre todas as
outras máquinas do cluster. A configuração SSH pode ser definida em um arquivo .ssh_config,
na raiz desse repositório.

Se você está suando vagrant, a configuração pode ser automaticamente definida com o comando
abaixo, que deve ser executado na raiz desse repositório, depois que todas as máquinas tenham
sido iniciadas.

```
vagrant ssh-config > .ssh_config
```

Use o seguinte comando para ter certeza que as máquinas podem ser acessadas pelo chake.

```
rake check
```

Antes da execução, é necessário editar mais dois arquivos de configuração. O arquivo `config/hosts.yaml'
deve conter uma lista das máquinas do cluster por papel (master ou slave). O padro é o seguinte:
```
masters:
  <hostname>: <ip address>
  <hostname>: <ip address>
  ...
slaves:
  <hostname>: <ip address>
  <hostname>: <ip address>
  ...
```

Por último, o arquivo `nodes.yaml` deve conter todas as máquinas todas as máquinas do cluster, listando as
receitas a serem executadas para cada máquina. A receita `basics` deve ser executada para todas as máquinas,
e a receita `master` apenas para a máquina a desempenhar o papel de master. Use o formato abaixo como
referÊncia.
```
master:
  run_list:
    - recipe[basics]
    - recipe[master]
slave1:
  run_list:
    - recipe[basics]
slave2:
  run_list:
    - recipe[basics]
```

Com isso, a receita pode ser executada.

```
rake converge
```

# Extrato de conta corrente

Desenvolvimento realizado para disciplina de Programação II/III da Universidade Feevale, solicitado pelo Professor Gabriel Simões como Trabalho 2.

SOLICITADO:

Conta Corrente<br>
O banco Muita Grana contratou você para desenvolver um sistema web para manter as transações das contas correntes de seus clientes. Na fase inicial, os clientes do banco ainda não possuem senhas de acesso, mas já conhecem os números de suas contas. Os números das contas são formados por 5 algarismos numéricos inteiros. Seu sistema deverá permitir, a partir da inserção de um número de conta, listar todas as transações de débito ou crédito vinculadas à conta informada, ordenando de maneira crescente de acordo com a data de ocorrência. Seu sistema deve também permitir a inserção de uma transação, seja de débito ou de crédito, associando cada transação a um valor monetário e uma conta informada.
<br>Seu sistema precisará obrigatoriamente manter:
<br>● Uma página web que permita a informação do número de conta, a listagem das transações,
<br>além da inserção de transações de débito ou crédito.
<br>● Ao final da lista de transações deve ser exibido o saldo atual da conta.
<br>● Um banco de dados com pelo menos uma tabela que manterá os registros vinculados às
contas.


Explicação da funcionalidade desenvolvida: https://youtu.be/FQ47X2dltz8


## Instalação
```sh
git clone https://github.com/carla-reis-cr/Acesso-Banco-Muita-Grana.git
```
## Configuração de desenvolvimento
Realizar a criação de um banco local, e utilizar o script na pasta DB:
```sh
Acesso-Banco-Muita-Grana/DB/COMANDO_SQL_CREATE_TABLE.sql
```
Não esquecer de subir o servidor, caso esteja utilizando o Netbens. Ajustar a Class TransacaoDAO, para se conectar no banco de dados da sua preferencia.

## Contribuições

1. Fork it (<https://github.com/carla-reis-cr/Acesso-Banco-Muita-Grana/fork>)
2. Criar a sua feature branch (`git checkout -b feature/fooBar`)
3. Commit das suas alterações (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Criando assim uma nova Pull Request

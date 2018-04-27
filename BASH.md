# Bash / Shell

Anotações sobre Bash / Shell para consulta e estudo.

## Conceito básico

### O que é

> Um script em shell é uma lista de comandos para execução do  sistema, tirando a necessidade de repeti-los toda vez para cumprir determinado objectivo ou ação.

## Construção do arquivo

### Nomenclatura

> Deve se adotar o nome desta maneira: `scriptName`< `.sh` | `.bash` >
> Pode-se usar tanto `.sh` quanto `.bash` para ser a extensão do arquivo

### Execução

1. Por comando em linha
    > Pode-se usar o seguinte comando para executar o script:

    ```bash
    sudo <sh | bash> scritpName<.sh | .bash>
    ```
    > Embora tenha dois comandos (`sh` e `bash`), é recomendado que se opte pelo segundo.

2. Usando `chmod`
    > Utiliza-se também o comando `chmod` para que execute-se o script apenas usando `./scriptName`
    * `chmod 555 <scriptName>` Permissões de leitura e escrita para todos.
    * `chmod +rx <scriptName>` Permissões de leitura e escrita para todos.
    * `chmod u+rx <scriptName>` Permissão de leitura e escrita apenas para o dono do arquivo.

3. De forma direta
    > Colocando o script na pasta `/usr/local/bin` - como root - você poderá executar penas usando `<scriptName>` e pressionando ENTER.

### Comentários

> Cria-se um comentário utilizando o `#`, a partir dele, sera desconsiderado para fins de execução qualquer elemento ou comando, a menos que o mesmo esteja previamente escapado com `"`, `'` ou `\`.

```bash
# Isso é um comentário
echo "Eu vou ser impresso"
echo # "Eu nao vou ser impresso"
```

### Header do arquivo

> Para indicar o interpretador de comandos para ser usado na execução do script adicione esse comando na primeira linha: `#!/bin/bash`

### Método correto para a saída de um script

> Para finalizar de forma correta um script deve-se adicionar o comando `exit`. Exemplo:

```bash
#!/bin/bash
echo "Hello, world!"
exit
```

#### Usando um código de saída

> Pode-se passar também apos o `exit` um código para indicar o valor de retorno, sendo `0` para sucesso e `1` para erro, mas um código personalizado pode ser usado para uso posterior.

### Criação de uma variável

> A sintaxe correta para a criação de uma variável é:

```bash
#!/bin/bash
MSG='Hello, world!'
echo $MSG
exit
```

#### Tipos de variáveis

> Em Bash não há tipagem de variáveis, isso é tanto uma benção quanto uma maldição. Não ter tipagem ajuda numa maior flexibilidade do script, mas permit erros e maus hábitos de programação.

### Uso da variável

> Como visto, para ser usado o valor de uma variável, deve-se usar `$` antes de escreve-la

```bash
MSG='Ola'
echo $MSG
```

## Boas práticas

### Ponto e virgulas

> Não se usa `;` em Bash scripts.

```bash
# Certo
echo "Hello, world!"
# Errado
echo "Hello, world!";
```

> Salvo alguns casos em que seu uso é necessário para a construção de uma estrutura:

```bash
if [ $algumaCois ]; then
    echo "Fazendo algo"
fi
```

### Estrutura condicional `If`

> Deve-se usar o `then` na mesma linha de seu respectivo `if`.

```bash
# Certo
if [ $algumaCoisa ]; then
    echo "Fazendo algo"
fi
# Errado
if [ $algumaCoisa ]
then
    echo "Fazendo algo"
fi
```

### Estrutura de repetição `While`

> Deve-se assim como no `if`, deixar o `do` na mesma linha de seu `while`.

```bash
# Certo
while [ $algumaCoisa ]; do
    echo "Fazendo algo"
done
# Errado
while [ $algumaCoisa ]
do
    echo "Fazendo algo"
done
```

### Substituição de comando

> Deve-se usar `$(<command>)` para substituir por um comando,

```bash
# Certo
foo=$(data)
# Errado
foo=`data`
```

### Funções

> Não se usa a `function` keyword para declarar uma função. Todas as variáveis criadas em uma função devem ser locais.

```bash
# Certo
foo() {
    local a=foo
}
# Errado
function foo() {
    a=foo
}
```

## Caracteres especiais

|    Caracter   | Uso                                                                       |
| :-----------: | :-----------------------------------------------------------------------: |
|       #       | Criação de comentários.
|       ;       | Encerramento de comando para realizar um novo na mesma linha.
|      ;;       | Encerramento de comando `case`.
|    ;;& ;&     | Encerramento de uma `case option`.
|       .       | [Source] Invoca e executa um scrip dentro do código.
|       .       | [Filename component] Um único uso `./` é considerado o diretório atual de trabalho, já dois seguidos `../` considera-se como o diretório pai.
|       '       | Preserva todos os caracteres especiais da interpretação.
|       "       | Preserva alguns dos caracteres especiais da interpretação.
|       ,       | Junta varias operações aritmética, realiza todas porem retorna somente a ultima.
|       \       | Caracter usado para `escape` dos outros, qualquer um que seja posterior a ele terá seu valor literal.
|       /       | Usado para construir e separar caminhos de arquivos. Exemplo:`/usr/local/bin`
|       `       | Torna o retorno de um comando disponível para associar a uma variável.
|       :       | Pode ser considerado um um sinônimo de true para o Shell, sendo assim o seu código de saída.
|       !       | Inverte o retorno de uma saída de teste ou de um comando.
|       *       | [Filename component] Corresponde a qualquer nome de arquivo ou de extensão do diretório.
|       *       | [Operador aritmético] Representa a operação de multiplicação
|       ?       | [Operador de teste] Indica uma expressão de teste assim como um operador ternário
|       ?       | [Filename component] Corresponde a somente um caracter do nome de um arquivo.
|       $       | [Variável] Retorna o valor de uma variável.
|       $       | [Expressão regular] Representa o fim que uma expressão regular deve corresponder.
|      ${}      | Substituição de parâmetro
|     $'...'    | Utilizado para `escape` de hexadecimais, octais...
|       $?      | Retorna o valor de saída de um comando, de uma função ou do script em si.
|       $$      | Mantem o valor de `process ID` do script.
|       ()      | Cria um agrupamento de comandos, executando-os em um `subshell`, variáveis internas não são visíveis para o resto do script.
|   {xx,yy,zz}  | Cria uma expansão de elementos informados dentro do `{ }`.
|     {a..z}    | Informa os elementos existentes dentre doi valores informados.
|       {}      | [Bloco de código] Delimita o espaço de uma função anonima.
|       []      | Representa uma expressão de teste.
|      [[]]     | Uma forma mais flexível que a maneira simples `[]`.
|     $[...]    | Realiza o calculo de uma expressão com inteiros.
|       <<      | Redirecionamento usado em um documento local
|       <<<     | Redirecionamento usado em uma string local
|      < , >    | Comparador de elementos `ASCII`
|       $?      | Realiza as delimitações de espaço de um expressão regular.
|  &#124;&#124; | Operador logico `OR`
|        &&     | Operador logico `AND`
|        &      | Delimita que um processo seja realizado em background.
|     &#124;    | Passa o valor de retorno do comando anterior para o valor de entrada do próximo. Esse método é utilizado para encadear comandos.
|       -       | [Operador aritmético] Realiza a operacao de subtração.
|       -       | [Prefixo] Operador em que se passa uma `flag` opcional para o comando.
|       --      | [Prefixo] Operado em que se passa uma `flag` opcional para um comando de forma extensa.
|       =       | Operador de atribuição de valor.
|       +       | [Operador aritmético] Realiza a operação de soma.
|       %       | Operador de modulo, retorna o resultado de uma divisão.
|       ~       | Representa o diretório `home`.
|       ~+      | Representa o diretório de trabalho atual.
|       ~-      | Representa o diretório de trabalho passado.
|       ^       | [Expressão regular] Representa o fim que uma expressão regular deve corresponder.


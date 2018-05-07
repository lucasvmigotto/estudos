# Bash / Shell

Anotações sobre Bash / Shell para consulta e estudo.

## Conceito básico

### O que é

Um script em shell é uma lista de comandos para execução do  sistema, tirando a necessidade de repeti-los toda vez para cumprir determinado objectivo ou ação.

## Construção do arquivo

### Nomenclatura

Deve se adotar o nome desta maneira: `scriptName`< `.sh` | `.bash` >
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

Cria-se um comentário utilizando o `#`, a partir dele, sera desconsiderado para fins de execução qualquer elemento ou comando, a menos que o mesmo esteja previamente escapado com `"`, `'` ou `\`.

```bash
# Isso é um comentário
echo "Eu vou ser impresso"
echo # "Eu nao vou ser impresso"
```

### Header do arquivo

Para indicar o interpretador de comandos para ser usado na execução do script adicione esse comando na primeira linha: `#!/bin/bash`

### Método correto para a saída de um script

Para finalizar de forma correta um script deve-se adicionar o comando `exit`. Exemplo:

```bash
#!/bin/bash
echo "Hello, world!"
exit
```

#### Usando um código de saída

Pode-se passar também apos o `exit` um código para indicar o valor de retorno, sendo `0` para sucesso e `1` para erro, mas um código personalizado pode ser usado para uso posterior. Quando não informado, o código de saída sera aquele que o ultimo comando ou função retornou.

### Criação de uma variável

A sintaxe correta para a criação de uma variável é:

```bash
#!/bin/bash
MSG='Hello, world!'
echo $MSG
exit
```

#### Tipos de variáveis

Em Bash não há tipagem de variáveis, isso é tanto uma benção quanto uma maldição. Não ter tipagem ajuda numa maior flexibilidade do script, mas permit erros e maus hábitos de programação.

#### Comando `declare`

Embora, há possibilidade de declarar uma variável alterando a suas propriedades, sendo assim uma forma bem simples de tipagem.

1. Apenas para leitura `-r`
    > Define a variável para apenas leitura, nenhum valor após aquele indicado em sua declaração poderá ser associado a ela novamente.
    ```bash
    declare -r um=1
    echo $um # 1
    (( um++ )) # Error, readonly variable
    ```
2. Inteiro `-i`
    > Define para que a variável trabalhe apenas com inteiros.
    ```bash
    declare -i numero=1
    echo $numero # 1
    numero=um
    echo $numero # 0 - Tentou associar texto a um inteiro
    ```
3. Array (vetor) `-a`
    > Trata a variável como um `Array`.
    ```bash
    declare -a vetor
    ```
4. Função `-f`
    > Sem argumentos define todas as funções previamente criadas.
    ```bash
    declare -f
    ```
    > Com argumentos declara somete aquela nomeada,
    ```bash
    declare -f nomeDaFunção
    ```
5. Exportação
    > Declara que a variável pode ser exportada para fora do escopo do script atual.
    ```bash
    declare -x variavelExportada
    ```

### Uso da variável

Como visto, para ser usado o valor de uma variável, deve-se usar `$` antes de escreve-la

```bash
MSG='Ola'
echo $MSG
```

### Variáveis internas

O Bash dispõe de algumas variáveis internas com informações úteis para o script como versão do Bash, diretórios de importantes arquivos e informações básicas de usuários.

|        Variável        |                Valor                |
|:----------------------:|:-----------------------------------:|
|       **$RANDOM**      | Retorna um valor inteiro randômico entre 0 e 32767 |
|        **$BASH**       | Retorna o caminho para o arquivo binário do Bash |
|      **$BASH_ENV**     | Variável que será lida quando um script for invocado |
|    **$BASH_SUBSHELL**  | Indica o nível do subshell atual |
|      **$BASHPID**      | Retorna o ID do processo da instancia atual do Bash, não é o mesmo que `$$` embora de o mesmo resultado |
|    **$BASH_VERSION**   | Retorna a versão do Bash instalada no sistema |
|  **$BASH_VERSINFO[n]** | Mesma informação que $BASH_VERSION, porem muito mais especificada em um Array de 6 posições contento informações |
|      **$DIRSTACK**     | O primeiro valor da pilha do diretório |
|       **$EDITOR**      | O editor padrão para edição de script |
|        **$EUID**       | O ID do usuário |
|      **$FUNCNAME**     | O nome da função atual |
|     **$GLOBIGNORE**    | Lista de padrões de nomes para serem excluídas de caminhos de arquivos |
|       **$GROUPS**      | O grupo que o usuário atual pertence |
|        **$HOME**       | O diretório base do usuário, geralmente `home/usuário` |
|      **$HOSTNAME**     | O nome do computador |
|      **$HOSTTYPE**     | O tipo de `host`, como `x86_32`, `x86_64`... |
|        **$IFS**        | Determina como o Bash reconhece campos e limites de palavras quando identificadas como `strings` |
|     **$IGNOREEOF**     | Quantos `end-of-files` o Shell vai ignorar antes de sair |
|     **$LC_COLLATE**    | Rege pela verificação de padroes e expansões de nomes de arquivos |
|      **$LC_CTYPE**     | Controla o tipo de interpretação de caracter que será utilizado |
|       **$LINENO**      | o número da linha que está sendo executado, grande uso para propósitos de depuração |
|      **$MACHTYPE**     | Identifica o hardware do sistema |
|       **$OLDPWD**      | Especifica o ultimo diretório de trabalho utilizado |
|       **$OSTYPE**      | Especifica o sistema operacional |
|        **$PATH**       | Exibe o(s) diretório(s) em que os arquivos binários estão alocados. |
|     **$PIPESTATUS**    | `Array` que guarda os últimos valores de saída de processos de `pipe` feitos em `foreground` |
|         **$PPID**      | O `ID` do processo pai em execução |
|   **$PROMPT_COMMNAD**  |  |
|          **$PS1**      | A linha do `prompt` principal |
|          **$PS2**      | A linha de um `prompt` secundário, como padrão `>` |
|          **$PS3**      | A linha de um `prompt` terciário apresentada em um `select loop` |
|          **$PS4**      | A linha de um `prompt` quaternário que será exibida quando um comando for executado com `-x`. Por padrão `+` |
|          **$PWD**      | Retorna o diretório de trabalho atual |
|         **$REPLAY**    | Guarda o valor do ultimo `read` realizado sem uma variável para guardar o valor a ser recebido |
|        **$SECONDS**    | O numero de segundos que o script vem sendo executado |
|       **$SHELLOPTS**   | Retorna uma variável apenas de leitura com todas as opções habilitadas do shell |
|         **$SHLVL**     | Retorna o nivel que o bash esta sendo executado, quando em linha de comando é 1, quando em script é 2. Porem não indica `sub shells`, para esse uso, utilize `$BASH_SUBSHELL` |
|        **$TMOUT**      | Caso seja definida para um valor diferente de zero, o script irá encerrar após o numero de segundos informados |
|         **$UID**       | Valor para o `ID` de uso atual que o usuário esta usando |
|     **$1, $2, $3...**  | Valor que retorna os parâmetros passando para a execução do script |
|          **$#**        | Numero de parâmetros passados |
|          **$***        | Todos os parâmetros passados porem em uma so palavra |
|          **$@**        | Mesmo uso que `$*` porem retorna as palavras contidas em `"` |
|          **$!**        | Retorna o `ID` do processo do ultimo trabalho executado em `basckground` |
|          **$_**        | O valor do parâmetro passado no ultimo comando |
|          **$?**        | O valor de saída do ultimo comando, função ou ate mesmo do script em si |
|          **$$**        | O valor de `PID (Proccess ID)` - Identificador do procedimento. |

### Escape

Escapar um caracter é um método para apresentar ao interpretador de script o caracter com o seu valor literal. Ou seja, ao escapar o `\` como `\\` o interpretador ira entender como uma contra barra comum. Porem alguns caracteres escapados guardam um significado para a execução.

|       Caracter        |            Significado            |
| :-------------------: | :-------------------------------: |
|         **\n**        | Representa uma nova linha
|         **\r**        | Representa o retorno
|         **\t**        | Representa um _tab_
|         **\v**        | Representa um _tab_ vertical
|         **\b**        | Representa um _basckspace_
|         **\a**        | Representa um _alert_
|         **\0xx**      | Representa o retorno em ASCII de um valor octal

### Substituição de parâmetro

Seu uso principal é destinado para concatenar os valores das variáveis com `strings`, em certos momentos o uso de `${}` é mai recomendado por ser menos ambíguo.

```bash
nome="Bruce Wayne"
echo "Ola, eu sou ${nome}" # Ola, eu sou Bruce Wayne
```

Há também a possibilidade de associar um valor padrão para caso a variável não seja usada ou até mesmo declarada.

```bash
# Declarada
echo "Qual a sua idade?"
read idade
echo "Sua idade é ${idade:-17}"
    # Se for informada: Sua idade é <idade>
    # Se não informada: Sua idade é 17

# Não declarada
var1=1
var2=2
# Não há uma variável declarada como var3
echo ${var1-$var2} # 1
echo ${var3-$var2} # 2
```

O uso de `-` e `:-` se da dependendo do uso e da situação já que para o primeiro a variável não precisa estar declarada, já no segundo caso a mesma deve ter sido declarada e estar com  `null`

Para definir um valor padrão imutável para uma variável ainda não declarada basta usar `${var=value}`

```bash
echo ${nome=Clark} # Clark
echo ${nome=Kent} # Clark
    # Note que o segundo output foi 'Clark' já que foi previamente definida
```

Caso seja necessário que o valor de uma variável seja setado e seu valor original não vá ser usado, bastar definir um valor para a mesma definindo um padrão.

```bash
nome="Bruce"
echo "Nome é ${nome:+Banner}" # Nome é Banner
```

Pode-se definir uma mensagem de erro para caso o `script` seja abortado durante a manipulação do valor.

```bash
echo ${errorMessage?}
```

### Construtores de Teste

Um teste para o Bash é uma estrutura com `[` que retornara um valor de 0 ou 1, sendo 0 verdadeiro e 1 falso. O interpretador enxerga uma estrutura como `[[ $a -lt $b ]]` sendo um elemento único com retorno.

### If, If Else, If Else If

A estrutura condicional If em bash segue os mesmos padrões que outras linguagens assim como suas estruturas encadeadas. Precisa-se de um teste para ter um retorno definindo assim o que sera feito, sendo a primeira ação sempre a com retorno `true` e a segunda `false`.

```bash
# Estrutura simples
if [[ $a != $b ]]; then
    echo "Verdadeiro"
fi
# Estrutura com else
if [[ $a != $b ]]; then
    echo "Verdadeiro"
else
    echo "Falso"
fi
# Estrutura encadeada
if [[ $a != $b ]]; then
    echo "Verdadeiro"
elif [[ $c != $a ]]; then
    echo "Verdadeiro do falso"
else
    echo "Falso do falso"
fi
```

Pode-se evitar também o uso de varias estruturas `if else if...` apenas juntando testes que podem ser feitos juntos:

```bash
if [[ $a -gt "0" ]] && [[ $a -lt "5" ]]; then
    echo "$a é maior que zero e menor que cinco"
else
    echo "$a é menor que zero ou maior que cinco"
fi
```

### Operadores

#### Teste

1. Arquivos

    |        Operador      |                                     Descrição                             |
    |  :-----------------:  |  :------------------------------------------------------: |
    |        **-e**       | Se o arquivo exite |
    |        **-a**       | Mesmo uso que o `-e` porem descontinuado |
    |        **-f**        | Se é um arquivo regular e não um diretório |
    |        **-s**       | Se o arquivo não tem tamanho 0 |
    |        **-d**       | Se o arquivo é um diretório |
    |        **-b**       | Se o arquivo é um `block device` |
    |        **-c**       | Se o arquivo é um `character device` |
    |        **-p**       | Se o arquivo é um pipe |
    |        **-h**       | Se o arquivo é um `simbolic link` |
    |        **-L**       | Meso uso do `-h` |
    |        **-S**       | Se o arquivo é um Socket |
    |        **-t**       | Se o arquivo é associado com o terminal |
    |        **-r**        | Se o arquivo tem permissão de leitura |
    |        **-w**      | Se o arquivo tem permissão de escrita |
    |        **-x**       | Se o arquivo tem permissão de execução |
    |        **-g**       | Se a `flag` `set-group-id` esta setada no arquivo ou diretório |
    |        **-u**       | Se a `flag` `set-user-id` esta setada no arquivo ou diretório |
    |        **-k**       | Se a `flag` `sticky by set` esta setada, caso seja em um arquivo ele so terá permissões de leitura, caso seja em um diretório o mesmo não terá permissão de escrita.|
    |        **-O**       | Se você é o proprietário do arquivo |
    |        **-G**       | Se o `group-id` é o mesmo que o seu |
    |        **-N**       | Se o arquivo foi modificado desde a ultima leitura. |
    | file1 **-nt** file2 | Se o `file1` é mais novo que `file2` |
    | file1 **-ot** file2 | Se o `file1` é mais velho que `file2` |
    | file1 **-ef** file2 | Se ambos arquivos são `hard links` para o mesmo destino |

2. com inteiros

    |       Operador      |                         Descrição                        |
    | :-----------------: | :------------------------------------------------------: |
    |  num1 **-eq** num2  | Se `num1` é igual a `num2` |
    |  num1 **-ne** num2  | Se `num1` não é igual a `num2` |
    |  num1 **-gt** num2  | Se `num1` é maior que `num2` |
    |  num1 **-ge** num2  | Se `num1` é maior ou igual a `num2` |
    |  num1 **-lt** num2  | Se `num1` é menor que `num2` |
    |  num1 **-le** num2  | Se `num1` é menor ou igual a `num2` |
    |  num1  **<**  num2  | Se `num1` é menor que `num2` |
    |  num1 **<=**  num2  | Se `num1` é menor ou igual a `num2` |
    |  num1  **>**  num2  | Se `num1` é maior que `num2` |
    |  num1 **>=**  num2  | Se `num1` é maior ou igual a `num2` |

3. com `strings`

    |       Operador      |                         Descrição                        |
    | :-----------------: | :------------------------------------------------------: |
    |   abc1 **=**  abc2  | Se `abc1` é igual a `abc2` |
    |   abc1 **==** abc2  | Sinônimo para o operador `=` |
    |   abc1 **!=** abc2  | Se `abc1` é diferente que `abc2` |
    |   abc1 **<**  abc2  | Se `abc1` é menor que `abc2` em ordem alfabética ASCII  |
    |   abc1 **>**  abc2  | Se `abc1` é maior que `abc2` em ordem alfabética ASCII  |
    |        **-z**       | Se a o valor é `null`, ou seja, não tem comprimento |
    |        **-n**       | Mesmo uso do `-z`, porem precisando estar entre `[[]]` |

4. com tipo logico

    |       Operador      |                         Descrição                        |
    | :-----------------: | :------------------------------------------------------: |
    |    ex1 **-a** ex2   | Retorna verdadeiro caso `ex1` e `ex2` sejam verdadeiros, ou seja, um conector logico `and` |
    |    ex1 **-o** ex2   | Retorna verdadeiro caso `ex1` ou `ex2` sejam verdadeiros, ou seja, um conector logico `or` |

#### Assimilação (`assignment`)

|     Operador      |                     Descrição                          |
|:-----------------:|:------------------------------------------------------:|
|       **=**       | Associa um valor a uma variável, alterando o antigo |

#### Aritméticos

|     Operador      |                     Descrição                          |
|:-----------------:|:------------------------------------------------------:|
|      **+**        | Operador para soma de valores |
|      **-**        | Operador para a subtração de valores |
|     **&#42;**     | Operador para a multiplicação de valores |
|      **/**        | Operador para a divisão de valores |
|     **&#42;**     | Operador para potenciação de valores |
|      **%**        | Operador para modulo de valores |
|      **+=**       | Operador de soma que associa o resultado ao valor original |
|      **-=**       | Operador de subtração que associa o resultado ao valor original |
|     **&#42;=**    | Operador de multiplicação que associa o resultado ao valor original |
|      **/=**       | Operador de divisão que associa o resultado ao valor original |
|      **%=**       | Operador de modulo que associa o resultado ao valor original |

#### Lógicos

|     Operador      |                     Descrição                          |
|:-----------------:|:------------------------------------------------------:|
|      **!**        | Operador lógico `NOT`, inverte a saída para o seu oposto |
|      **&&**       | Operador lógico `AND`, retorna verdadeiro se todos os valores assim forem |
| **&#124;&#124;**  | Operador lógico `OR`, retorna verdadeiro com apenas um deles sendo verdadeiro |

### Constantes numéricas

Bash ira interpretar todo numero como sendo de base decimal caso não seja apresentado um prefixo indicando a mesma. Números iniciados com `0` serão octais e `0x` serão hexadecimais. Porem há como informar uma base especifica usando o padrão `base#num`, sendo `base` a base desejada e `num` o valor a ser informado.

```bash
echo $((36#zz)) $((2#1010101010)) $((16#AF16)) $((53#1aA))
#       1295           170            44822        3375
```

### Manipulação de `Strings`

O Bash conta com um numero surpreendente de funções e maneiras de trabalhar e manipular `strings`. Infelizmente não são bem definidas de forma que seu uso seja fácil ou funcional, acontecendo então alguns episódios de erros durante sua utilização.

1. Comprimento da `String` - `String Length`
    > Retorna o tamanho do comprimento da String informada com o comando $(expr lenght nomeDaString).

    ```bash
    nome="Peter Parker"
    echo ${#nome} # 12
    echo $(expr length $nome) # 12
    ```

2. Comprimento de uma `matching substring`
    > Retorna o tamanho do comprimento de uma `matching substring`, com o comando $(expr ***stringPrincipal expressãoRegular***).

    ```bash
    string=abcABC123ABCabc
    echo $(expr match "$string" 'acb[A-Z]*.2') #8
    ```

3. Index da `string`
    > Retorna o index de quando um determinado padrão pre informado em um `substring` inicia em uma  `string`, com o comando $(expr index ***stringPrincipal stringParaEncontrar***)

    ```bash
    string="quandoissocomeca?"
    echo $(expr index "$string" "isso") # 6
    ```

4. Extração de `substring`
    > Retorna uma `substring` de uma `string` podendo informar a posição inicial e como parâmetro adicional opcional um comprimento que deve ser usado, com o comando ${***stringParaSerUsada***:***posiçãoDeInicio***}.

    ```bash
    string="peguessodaqui"
    # Sem comprimento definido
    echo ${string:5} # issoaqui

    # Com comprimento definido
    echo ${string:5:4} #isso
    ```

5. Remoção de uma parte da `string`
    > Retorna a `string`  original sem um certo pedaço pré-especificado retirado da frente do texto principal.

    ```bash
    string="issonaoexiste"
    # Reirar a menor sessão possível
    echo ${string#i*o} # issoexiste
    # Reirar a maior sessão possível
    echo ${string##i*o} # existe
    ```

    > Retorna o mesque o anterior so que desta vez retirado da parte de trás da `string`

    ```bash
    string="issonaoexiste"
    # Retirar a menor sessão possível
    echo ${string%e*e} # issonao
    # Retirar a maior sessão possível
    echo ${string%o*e} # iss
    ```

6. Recolocar outra `string` no lugar
    > Troca em uma `string` um certo valor por outro.

    ```bash
    string="retireissoecoloqueisso"
    # Retirando somente a primeira vez que aparecer
    echo ${string/isso/aquilo} # retireaquiloecloloqueisso
    # Retirando todas as vezes que aparecerem
    echo ${string/isso/aquilo} #retireaquiloecoloqueaquilo

    # Retirando apenas aqueles encontradas no início da string
    string="issodevevirarisso"
    echo ${string/#isso/aquilo} #aquilodevevirarisso
    # Retirando apenas aqueles encontradas no fim da string
    echo ${string/%isso/aquilo} #issodeveviraraquilo
    ```

#### Usando `awk`

Um script Bash pode escolher chamar as facilidades de manipulação de `strings` do comando `awk` como uma alternativa dos comando nativos para isso.

## Boas práticas

### Ponto e virgulas

Não se usa `;` em Bash scripts.

```bash
# Certo
echo "Hello, world!"
# Errado
echo "Hello, world!";
```

Salvo alguns casos em que seu uso é necessário para a construção de uma estrutura:

```bash
if [ $algumaCois ]; then
    echo "Fazendo algo"
fi
```

### Estrutura condicional `If`

Deve-se usar o `then` na mesma linha de seu respectivo `if`.

```bash
# Certo
if [[ $algumaCoisa ]]; then
    echo "Fazendo algo"
fi
# Errado
if [[ $algumaCoisa ]]
then
    echo "Fazendo algo"
fi
```

### Estrutura de repetição `While`

Deve-se assim como no `if`, deixar o `do` na mesma linha de seu `while`.

```bash
# Certo
while [[ $algumaCoisa ]]; do
    echo "Fazendo algo"
done
# Errado
while [[ $algumaCoisa ]]
do
    echo "Fazendo algo"
done
```

### Substituição de comando

Deve-se usar `$(<command>)` para substituir por um comando,

```bash
# Certo
foo=$(data)
# Errado
foo=`data`
```

### Funções

Não se usa a `function` keyword para declarar uma função. Todas as variáveis criadas em uma função devem ser locais.

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

### Tests

Usar estrutura com duplo `[` ao invés de somente um.

```bash
# Certo
if [[ $a == $b ]]; then
    echo 'Verdade!'
fi
# Errado
if [ $a == $b ]; then
    echo 'Falso!'
fi
```

## Caracteres especiais

|      Caracter     | Uso                                                                       |
| :---------------: | :-----------------------------------------------------------------------: |
|       **#**       | Criação de comentários.
|       **;**       | Encerramento de comando para realizar um novo na mesma linha.
|      **;;**       | Encerramento de comando `case`.
|    **;;& ;&**     | Encerramento de uma `case option`.
|       **.**       | [Source] Invoca e executa um scrip dentro do código.
|       **.**       | [Filename component] Um único uso `./` é considerado o diretório atual de trabalho, já dois seguidos `../` considera-se como o diretório pai.
|       **'**       | Preserva todos os caracteres especiais da interpretação.
|       **"**       | Preserva alguns dos caracteres especiais da interpretação.
|       **,**       | Junta varias operações aritmética, realiza todas porem retorna somente a ultima.
|       **\**       | Caracter usado para `escape` dos outros, qualquer um que seja posterior a ele terá seu valor literal.
|       **/**       | Usado para construir e separar caminhos de arquivos. Exemplo:`/usr/local/bin`
|       **`**       | Torna o retorno de um comando disponível para associar a uma variável.
|       **:**       | Pode ser considerado um um sinônimo de true para o Shell, sendo assim o seu código de saída.
|       **!**       | Inverte o retorno de uma saída de teste ou de um comando.
|     **&#42;**     | [Filename component] Corresponde a qualquer nome de arquivo ou de extensão do diretório.
|     **&#42;**     | [Operador aritmético] Representa a operação de multiplicação
|       **?**       | [Operador de teste] Indica uma expressão de teste assim como um operador ternário
|       **?**       | [Filename component] Corresponde a somente um caracter do nome de um arquivo.
|       **$**       | [Variável] Retorna o valor de uma variável.
|       **$**       | [Expressão regular] Representa o fim que uma expressão regular deve corresponder.
|      **${}**      | Substituição de parâmetro
|     **$'...'**    | Utilizado para `escape` de hexadecimais, octais...
|       **$?**      | Retorna o valor de saída de um comando, de uma função ou do script em si.
|       **$$**      | Mantem o valor de `process ID` do script.
|       **()**      | Cria um agrupamento de comandos, executando-os em um `subshell`, variáveis internas não são visíveis para o resto do script.
|   **{xx,yy,zz}**  | Cria uma expansão de elementos informados dentro do `{ }`.
|     **{a..z}**    | Informa os elementos existentes dentre doi valores informados.
|       **{}**      | [Bloco de código] Delimita o espaço de uma função anonima.
|       **[]**      | Representa uma expressão de teste.
|      **[[]]**     | Uma forma mais flexível que a maneira simples `[]`.
|     **$[...]**    | Realiza o calculo de uma expressão com inteiros.
|       **<<**      | Redirecionamento usado em um documento local
|       **<<<**     | Redirecionamento usado em uma string local
|      **< , >**    | Comparador de elementos `ASCII`
|       **$?**      | Realiza as delimitações de espaço de um expressão regular.
|  **&#124;&#124;** | Operador logico `OR`
|        **&&**     | Operador logico `AND`
|        **&**      | Delimita que um processo seja realizado em background.
|     **&#124;**    | Passa o valor de retorno do comando anterior para o valor de entrada do próximo. Esse método é utilizado para encadear comandos.
|       **-**       | [Operador aritmético] Realiza a operacao de subtração.
|       **-**       | [Prefixo] Operador em que se passa uma `flag` opcional para o comando.
|       **--**      | [Prefixo] Operado em que se passa uma `flag` opcional para um comando de forma extensa.
|       **=**       | Operador de atribuição de valor.
|       **+**       | [Operador aritmético] Realiza a operação de soma.
|       **%**       | Operador de modulo, retorna o resultado de uma divisão.
|       **~**       | Representa o diretório `home`.
|       **~+**      | Representa o diretório de trabalho atual.
|       **~-**      | Representa o diretório de trabalho passado.
|       **^**       | [Expressão regular] Representa o fim que uma expressão regular deve corresponder.
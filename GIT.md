# Git

Do commit ao rebase.

## O que é

> Git é um controle de versionamento `open source` para gerenciamento de um projeto visando a velocidade e eficiência.

## Termos

### O que é Repositório

### O que é Commit

### O que é Branch

## Comandos

### Init

> Cria e inicializa uma pasta `.git/` dentro do diretório do projeto.

```bash
git init
```

### Remote

> Configura o(s) repositório(s) remoto(s).
1. #### add
    > Adiciona um novo endereço de repositório remoto.

    ```bash
    git remote add <nome> <endereco HTTP ou SHH>
    ```
2. #### remove
    > Remove um endereço de um repositório remoto.

    ```bash
    git remote remove <name>
    ```
3. #### rename
    > Renomeia um repositório já cadastrado.
    ```bash
    git remote rename <nome velho> <novo nome>
    ```

### Branch

> Exibe todas as `branches` - remotas e locais - e destaca a que esta em uso.

```bash
git branch
```

### Checkout

> Troca a `branch` de trabalho atual.

```bash
git checkout <nome da branch>
```

1. Opção -b
    > Ao invés de trocar a `branch`, cria-se uma nova.
    ```bash
    git checkou -b <nome da nova branch>
    ```

### Status

> Mostra como os arquivos da branch local estão em relação a remota.

```bash
git status
```

### Add

> Adiciona arquivos alterados para posteriormente fazer commit dos mesmos.

```bash
git add <filename>
```

### Commit

> Armazena os arquivos mudados em um ponto com uma mensagem definida pelo usuário explicando e listando as mudanças.
1. Opção `-a --all`
    > Adiciona a mensagem para todos os arquivos alterados.
    ```bash
    git commit -a <mensagem>
    ```
2. Opção `-m --message`
    > Adiciona a mensagem para apenas os aquivos previamente adicionados na `Stage changes`
    ```bash
    git commmit -m "<mensagem>"
    git commit --message="<message>"
    ```

### Push

> Publica as mudanças adicionadas e `commitadas` no repositório remoto em um determinada `branch` especificada previamente.

```bash
git push <repositorio> <branch destino>
```

### Diff

> Exibe a diferença entre duas `branchs` ou dois `commits`

```bash
git diff <master..dev>
git diff <d80daf58..7d85fad8>
```

### Rebase

1. Opção `-i --interactive`
    > Inicia o processo de `rebase` de forma interativa, abrindo janelas para seguintes configurações.
    ```bash
    git rebase -i <branch>
    ```

2. Opção --continue
    > Confirma o processo configurado de `rebase` previamente realizado no `git rebase -i`

3. Opção --abort
    > Aborta o processo de `rebase`

### Merge

> Realiza o `merge` de duas `branchs` diferentes.
1. Opção --no-ff
    > Cria apos o `merge` um `commit` para indicar a junção ocorrida.
    ```bash
    git merge --no-ff <branch>
    ```
# GraphQL

Um primeiro projeto usando GraphQL, endendo e aplicando.

## O que é

O GraphQL é uma tecnologia de consulta a dados em APIs craida pelo **Facebook** em 2012, e usada por eles desde então. Já em 2015, a empresa disponibilou o recurso como _open source_ para que toda a comunidade pudesse utilizar. Ele não está vinculado com qualquer banco de dados  ou sistema de armazenamento.

## O que ele faz

Uma forma eficiente de busca e consulta de dados em APIs utilizando queries de pesquisa apenas com os campos necessários. Otimizando a quantidade do trafego de dados nas consultas.

## Conceitos básicos

### Type System

Um sistema que  podemos utlizar para definr o tipo de dados que serão trabalhados.

```javascript
type User {
    name: String!
    email: String!
    photo: String
}

type Post {
    title: String!
    content: String!
    photo: String!
    author: User!
    comments: [ Comment! ]!
}

type Comment {
    comment: String,
    user: User!
    post: Post!
}
```

> Usa-se o '!' para definir um campo obrigatório

### Queries

Uma forma de opter dados de uma API, sendo uma analogia ao padrão **REST**, podemos dizer que trabalha de forma parecida com o que seria usado para o método _GET_. Porém usando a ideia de consulta do **GraphQL**.

> Definição de uma query

```javascript
type Query {
    users: [ User! ]!
}
```

> Requisição no Client

```
{
    query {
        users {
            name
            email
        }
    }
}
```

> JSON retornado

```json
{
    "data": {
        "users": [
            {
                "name": "John",
                "email": "john@doe.com"
            },
            ...
        ]
    }
}
```

### Mutations

Para alterações dos dados da API, voltando a analogia com o padrão **REST**, podemos ver que as _mutations_ englobariam os método _POST_, _PUT_ e _DELETE_.

> Definição da Mutatiion

```javascript
type Mutation {
    createUser(name: String!, email: String!): User!
}
```

> Requisição no Client

```
{
    mutation {
        createUser(
            name: "John",
            email: "john@doe.com"
        ){
            name
        }
    }
}
```

> JSON retornado

```json
{
    "data": {
        "createUser": {
            "name": "John"
        }
    }
}
```

### Schema

Define o _schema_ da API, funcionando como um _conatainer_ para os tipos criados para a API.

## NodeJS

### O que é

É uma plataforma criada em cima do motor _JavaScript V8_ do Google Chrome que nos possibilita executar códigos _JavaScript_ diretamente no servidor. Ideal para o desenvolvimento de aplicações em que haja uma constante comunicação entre o ***Client*** e o ***Server***, alem de troca de dados entre dispositivos distribuídos. Exemplos de sua aplicabilidade seriam serviços de _Chats_, _Feed de notícias_ e _Web push notifications_.

### Como funciona

Ao contrário de outrad liguagens como **Java** ou **Ruby**, **NodeJS** é _single thread_, ou seja, trabalha e executa uma _Thread_ por processo iniciado. Mas existem bibliotecas e outras maneiras que permitem que essa funcionalidade seja incorporada ao **NodeJS**.

Outra forma de processamento paralelo em **NodeJS** é o conceito de _Assincronismo_. O NodeJS trabalha com eventos de ***I/O não bloqueantes***, ou seja, caso a aplicação em questão necessite fazer um processo paralelo como ler um grande arquivo, essa tarefa será colocada em _background_, e após a fila de tarefas for terminda, o ***callback*** da leitura do arquivo será chamado.

## Rest

### O que é

Padrão de construção para projetar APIs baseadas em ***endpoins*** (_recursos_), ***métodos*** (_verbos_) e ***códigos HTTP***. Esse forma de construção oferece boas ideias e práticas como o ***stateless severs***, não mantendo o estado dos dados no servidor, alem de acesso estruturado aos recursos.

### Como funciona

Através de uma _requisição HTTP_ feita para uma determinada _URL_ com um dos verbos (_GET_, _POST_, _PUT_...) que esteja sendo ouvida pelo servidor, a API consultada recebe a requisição, usa os parâmetros que podem ter sido passados, e retorna uma resposta em ***json*** na maioria das vezes.

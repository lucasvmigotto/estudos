# Rest

## O que é

REST ou _**RE**presentational **S**tate **T**ransfer_ é um padrão de construção para projetar APIs baseadas em _endpoints_ (_resources_), métodos (_verbs_) e códigos HTTP. Essa forma de construção oferece boas ideias e práticas como o _stateless severs_, não mantendo o estado dos dados no servidor, alem de acesso estruturado aos recursos.

## Entendendo conceitos básicos

### Separação de _client_ e _server_

Na arquitetura REST, tanto a implementação do _client_ quanto a do _server_ podem co-existir sem ao menos uma ter conhecimento da outro.
Isso destaca que o código do _client_ pode ser alterado de forma que não influencie no _server_ bem como o contrário também acontece.

Essa característica se mantem enquanto um souber receber e enviar requisições para o outro. Sendo assim, ambos podendo estar modularizados e separados. Dividir e separar a interface do _client_ da interface de armazenamento de dados, melhora a flexibilidade da interface de através das plataformas e aprimorando e simplificando os componentes do _server_. Alem do fato da separação oferecer a possibilidade de cada componente evoluir de maneira independente.

Usando REST, diferentes usuários acessam o mesmo conteúdo, através dos mesmos _endpoints_, com as mesmas requisições e recebendo as mesmas _responses_.

### _Statelessness_

Sistemas ou aplicações que seguem o paradigma do REST são _statelessness_ (sem estado), ou seja, o _server_ não precisa saber em qual estado o _client_ está bom como o contrário. _Server_ e _client_ podem se comunicar e receber mensagens sem precisar se haviam mensagens já envidadas anteriormente e seu conteúdo. A principal ideia dessa característica é o uso de _resources_ (recursos) ou invés de _commands_ (comandos), com _resources_ pode-se descrever todo e qualquer conteúdo que se possa querer trabalhar, seja um objeto, documento ou algo que precisa ser guardado em um dispositivo para outros serviços.

### Comunicação entre _client_ e _server_

Toda a ideia do REST é baseada em _requests_ (requisições) e _responses_ (respostas). O _client_ precisa de um dado, ou que o mesmo seja processado, envia uma _request_ para o _server_, este recebe a requisição e retorna os dados em uma _response_ para o _client_.

#### _Requests_ (Requisições)

Uma requisição do _client_ para o _server_ deve contar com algumas partes.

1. Verbo HTTP

    Há quatro verbos HTTP básicos para realizar as operações padrões de um sistema REST para trabalhar com seus _resources_:
    * _GET_ - Recupera um dado por _id_ ou uma coleção de _resources_.
    * _POST_ - Cria um novo _resource_.
    * _PUT_ - Atualiza por _id_ um determinado _resource_.
    * _DELETE_ - Remove um _resource_ específico por _id_.

2. _Header_

   No _header_ de uma requisição, o _client_ indica o tipo de conteúdo que irá ser retornado, assegurando que o _server_ não envie como response um tipo que o _client_ não seja capaz de processar. Isso é posto no campo `Accept`. São postos como valores nesse campo tipos _MIME_ (Multipurpose Internet Mail Extensions).
   _MIME type_ são definidos por um tipo e um subtipo separados por um `/`. Como exemplo, caso seja o caso de um _HTML_, o compo `Accept` deve receber `text/html`, se esse _HTML_ utiliza _CSS_ deve ser definido como `text/css`, caso seja apenas texto genérico seria `text/plain`.
   Alguns outros casos de uso comuns são:
   * `image` - `image/png`, `image/jpeg`, `image/gif`
   * `audio` - `audio/wav`, `image/mpeg`
   * `video` - `video/mp4`, `video/ogg`
   * `application` - `application/json`, `application/pdf`, `application/xml`

    ```http
    GET /article/23
    Accept: text/html, application/xhtml
    ```

    > Ao requisitar o artigo com _id_ 23, o _client_ informa que aceita uma resposta `text/html` ou `application/xhtml`

3. Caminho para o _resource_ (_path_)

    Cada requisição deve ter um _path_ indicando a qual _resource_ o _client_ esta requisitando. O caminho criado deve mostrar ao _client_ de forma clara o que esta acontecendo e sendo requisitado.
    Por convenção, a primeira parte do caminho indicando o _resource_ a ser usado deve estar no plural, para ficar fácil de ler e entender.
    Para recuperar uma lista de usuários por exemplo, um caminho possível pode ser `domain.com/users`. Já um caminho como `domain.com/users/3/shopList/12` é fácil de ser compreendido, basta apenas entender o nível hierárquico que é descrito, é requisitado do usuário com _id_ 3, o item com _id_ 12 da sua lista de compras.

4. Mensagem opcional no corpo da requisição

    Para alguns cenários, talvez seja necessário que uma mensagem com dados seja informada no corpo da requisição. Para por exemplo inserir ou atualizar um _resource_, pode ser preciso informar os dados atráves de um _JSON_ no _body request_.

    ```http
    POST domain.com/users
    ```

    > Método e caminho para cadastrar um usuário

    ```json
    {
        "name": "John Doe",
        "email": "john.doe@mail.com"
    }
    ```

    > _JSON_ passado no _body_ da requisição para informar os dados para o usuário a ser criado pelo _server_

#### _Responses_ (Respostas)

Quando o _server_ termina de processar uma _request_ e vai responder para o _client_ que a requisitou, a _response_ que deverá ser enviada deve conter algumas informações, como:

1. _Content-type_

    Caso seja o caso do _server_ retornam alum dado que possa ser utilizado pelo _client_ como uma coleção de dados, é preciso informar no _header_ da requisição o `content-type`. Esse campo informa para o _client_ o tipo do dado que está sendo mandado, necessariamente deve estar de acordo com um dos especificados como aceitos na requisição no compo `accept`. Os tipos aceitos no `content-type` também são _MIME types_.

    ```http
    GET domain.com/articles/23
    Accept: text/html, application/xhtml
    ```

    > Uma requisição que aceita _HTML_ e _XHTML_

    ```http
    HTTP/1.1 200 (OK)
    Content-type: text/html
    ```

    > A resposta do _server_ indicando que o tipo da resposta enviada é fo tipo `text/html`, um dos tipos aceitos pelo _client_

2. _Response code_ (código de resposta)

    _Response codes_ são códigos que o _server_ retorna para o _client_ alertando que tipo de retorno e como a operação foi finalizada, seja com erro, ou sucesso. Não há necessidade para os desenvolvedores saberem todos já que existem [muitos](https://goo.gl/L9dmrA), mas alguns devem ser entendidos por serem frequentemente mais usados.

|           Status Code         |             Meaning
| :---------------------------: | :---------------------------|
|            200 (OK)           | O código padrão de resposta HTTP para sucesso
|         201 (_created_)       | O código padrão de resposta HTTP pra quando um _resource_ for criado com sucesso
|       204 (_no content_)      | O código padrão de resposta HTTP para uma response que não tem elemento de retorno
|       400 (_bad request_)     | A requisição não pode ser concluída por um erro de sintaxe, tamanho excessivo ou um erro do _client_
|        403 (_forbidden_)      | O _client_ não tem acesso a esse conteúdo
|        404 (_not found_)      | O _resource_ requisitado não foi encontrado ou não existe.
| 500 (_internal server error_) | Uma resposta genérica do para quando um erro interno sem informação adicional ocorrer

> Para cada verbo _HTTP_, existe um _response code_ esperado para ser retornado:
> * _GET_ - 200 (OK)
> * _POST_ - 201 (_CREATED_)
> * _PUT_ - 200 (OK)
> * _DELETE_ - 204 (_no content_)
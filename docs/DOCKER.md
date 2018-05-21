# Docker

Docker é uma plataforma que para desenvolvedores com o objetivo de ***develop***, ***deploy*** e ***run*** aplicações com containers. Embora os containers não sejam uma tecnologia nova, seu uso para o _deploy_ de aplicações é recente. Algumas razões para o seu uso:

1. Flexível
2. _Lightweight_
3. Permutável
4. Portável
5. _Scalable_
6. _Stackable_

## Imagens e containers

Um container é lançado assim que uma imagem é executada. Uma imagem é um pacote executável que contém todas as informações que a aplicação irá precisar, seja arquivos de configuração, variáveis de ambiente, bibliotecas...

## Containers e Máquinas virtuais

Um container usa o mesmo _kernel_ que o _host_, quando executado, se torna um processo leve, não gastando mais que outro executável. Já uma máquina virtual utiliza todo o processamento que um _guest_ requisitaria, alem do fato que uma _vm_ utiliza recursos adicionais que podem não ser usados durante a aplicação.

## Imagens oficiais

Algumas imagens oficiais são oferecidas no [Docker Hub](https://goo.gl/zTQasP) para serem usadas. Assim, tirando a necessidade de construir o _Dockerfile_.

## Docker compose

Arquivo onde a imagem e as configurações são definidas para serem usadas.

```yml
# Definir a versão que será usada
version: '2'
  # Declara os serviços que serão utilizados
  services:
    # Cria um serviço
    pg:
      # Indica a imagem do serviço que será usado
      image: postgres
      # Dependendo da daocumentação oficial,
      # variáveis de ambiente podem ser necessarias
      environment:
        - POSTGRES_USER=admin
        - POSTGRES_PASSWORD=admin
        - POSTGRES_DB=dbName
      # Indica a porta que será usada no container
      # Caso uma porta do container tenha que se comunicar
      # com uma local deve-se indicar <local>:<container>
      # Ex: - 8000:8000
      ports:
        - 5432
      # Indica o que será trabalhado
      volumes:
        - db:/var/lib/pastgresql/data

```
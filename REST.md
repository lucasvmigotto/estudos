## Rest

### O que é

Padrão de construção para projetar APIs baseadas em ***endpoins*** (_recursos_), ***métodos*** (_verbos_) e ***códigos HTTP***. Esse forma de construção oferece boas ideias e práticas como o ***stateless severs***, não mantendo o estado dos dados no servidor, alem de acesso estruturado aos recursos.

### Como funciona

Através de uma _requisição HTTP_ feita para uma determinada _URL_ com um dos verbos (_GET_, _POST_, _PUT_...) que esteja sendo ouvida pelo servidor, a API consultada recebe a requisição, usa os parâmetros que podem ter sido passados, e retorna uma resposta em ***json*** na maioria das vezes.

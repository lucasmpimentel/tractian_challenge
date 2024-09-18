# Welcome to my TRACTIAN - Mobile Challenge!

Link para o *TRACTIAN* [Read-me](https://github.com/tractian/challenges/blob/main/mobile/README.md) aqui.

## Índice

-   [Índice](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README-ptBR.md#%C3%ADndice)
-   [Descrição Geral](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README-ptBR.md#descri%C3%A7%C3%A3o-geral)
-   [Apresentação do Protótipo](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README-ptBR.md#apresenta%C3%A7%C3%A3o-do-prot%C3%B3tipo)
-   [Escopo](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README-ptBR.md#escopo)
-   [Requisitos](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README-ptBR.md#requisitos)
-   [O que Poderia ser Melhor](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README-ptBR.md#o-que-poderia-ser-melhor)
-   [Desafios Enfrentados](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README-ptBR.md#desafios-enfrentados)
-   [Ferramentas Utilizadas no Projeto](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README-ptBR.md#ferramentas-utilizadas-no-projeto)
-   [Versão em Inglês](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README-ptBR.md#vers%C3%A3o-em-ingl%C3%AAs)

## Descrição Geral

Este documento contém as especificações para a criação de um aplicativo mobile que consome dados da API da *Tractian* e os exiba em uma estrutura de árvore. Temos a presença dos filtros de nome, nível de criticidade, e tipo de sensor. Há também uma barra de pesquisa.
O objetivo desta aplicação é fornecer uma forma de gerenciamento e manutenção adequada para garantir o funcionamento eficiente de ativos essenciais à operação de indústrias.

## Apresentação do Protótipo

(vídeo aqui)

## Escopo

Desenvolvido um aplicativo mobile capaz de atender aos Sistemas Operacionais *iOS* e *Android* utilizando o framework multiplataforma *Flutter* onde é aplicada a linguagem *Dart*. 
 
 
## Requisitos

*1. Página inicial*

É o menu para os usuários navegarem entre diferentes empresas e acessarem seus ativos.

*2. Página de ativos*

-   A Árvore de Ativos é o recurso principal, oferecendo uma representação visual em árvore da hierarquia de ativos da empresa.
-   *Sub-recursos:*
    
    1.  *Visualização*
        
        -   Apresente uma estrutura de árvore dinâmica exibindo componentes, ativos e locais.
    2.  *Filtros*
        
        *Pesquisa de texto*
        
        -   Os usuários podem pesquisar componentes/ativos/locais específicos dentro da hierarquia de ativos.
        
        *Sensores de energia*
        
        -   Implemente um filtro para isolar sensores de energia dentro da árvore.
        
        *Status crítico do sensor*
        
        -   Integre um filtro para identificar ativos com status de sensor crítico.
    
    -   Quando os filtros são aplicados, os pais do ativo *não podem* ser ocultados. O usuário deve conhecer todo o caminho do ativo. Os itens que não estão relacionados ao caminho do ativo devem ser ocultados.

## O que poderia ser melhor

 - Refinar a listagem;
 - Finalizar a feature que aplica o cache e adicionar o banco de dados offline (como o SQLite por exemplo);
 - Explorar melhor o uso de isolates;
 - Construir testes mais refinados e com cobertura mais abrangente por consequência;
 - Adiconar ao projeto uma tela de detalhes contendo informações a respeito dos componentes baseadas na API.


## Desafios Enfrentados

 - Lidar com a API propositadamente desorganizada;
 - Montar a estrutura primária do projeto;
 - Utilizar a recursividade do Flutter com maior eficiência.

## Ferramentas Utilizadas no Projeto

 - *Clean Arch*: separar as responsabilidades do código para que haja independência e maior foco nas regras de negócio estabelecidas;
 - *Dio*: realização das requests de forma simplificada;
 - *Cubit*: gerenciamento de estado simplificado;
 - *GetIt*: injeção de dependências;
 - *Mocktail*: facilitar os testes criando mocks sem necessitar gerar código extra.

## Versão em Inglês

Read-me em inglês [aqui](https://github.com/lucasmpimentel/tractian_challenge/blob/main/README.md).

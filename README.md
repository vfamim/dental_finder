# Dental Finder

Este projeto é uma iniciativa do curso [PED - Preparatório para Entrevistas em
Dados](https://hotmart.com/pt-br/marketplace/produtos/ped-preparatorio-para-entrevistas-em-dados/L86879142E).

## Objetivo

O objetivo deste teste é realizar uma análise de dados utilizando um dataset da
empresa Real, que contém informações sobre a aquisição de clínicas. Este teste
objetiva ver como você se comporta em uma situação real de trabalho, e com
problemas que encontrará diariamente dentro de nosso time.

## Arquitetura

- Ingestão de dados com Python
- Banco de dados Postgres localizado localmente
- Deploy com dockers
- Transformação com dbt (data build tool)

## Estratégia de negócio

Para trazer as principais métricas relacionadas à aquisição de clínicas e fazer uma análise exploratória de dados, identificar gargalos e oportunidades para otimizar a entrada de clinicas na _Real_.
Estão sendo disponibilizados três datasets:

### Tabela clinics

Contem informações sobre as clínicas cadastradas e alguns marcos temporais delas, como trial e credenciamento.

- Linhas: 2219
- Colunas: 26
- Clinicas que usam financiamento real podem ser removidas da análise de conversão de assinaturas
- observar colunas:
  - `business_segmentation is not "Rede Homologada"`
  - `is_chain_clinic is not true`.

### Tabela subscriptions

Contém informações de **assinaturas** de clínicas. A assinatura é definida como o início de um esquema de pagamentos recorrentes, possuindo início, data de fim (caso tenha sido encerrada) e a recorrência de pagamentos. Se uma clínica começar uma assinatura, encerrar ela e depois voltar a ser assinante, ela terá múltiplas linhas de assinatura.

- Linhas: 385
- Colunas: 18

### Tabela activity

Registra todas as **atividades** realizadas pela clínica, contendo registros temporais de quando a clínica desempenhou uma determinada ação. Temos diversos tipos de atividades no produto, que por sua vez estão organizadas em níveis hierarquicos para facilitar nosso trabalho com elas. Esses níveis estão disponíveis nas features:

- Linhas: 13941
- Colunas: 12
- module
- analytics_domain
- feature
- As atividades realizadas apenas em período de trial.

## Insights relevantes

- client_id repetidos estão na fase `activity_at`, `activity_type` e `feature/module/analytics_domain`

## Sugestões de métricas a serem avaliadas

As métricas a serem analisadas devem estar alinhadas ao objetivo do estudo, que é entender o período de trial e como ele pode ser melhorado. Nesse sentido, as métricas devem permitir identificar os seguintes aspectos:

- Quantidade de usuários que iniciam o período de trial: Essa métrica é importante para entender o alcance do período de trial e se ele está sendo oferecido a um número suficiente de usuários.
- Quantidade de usuários que concluem o período de trial: Essa métrica é mais importante, pois indica quantos usuários realmente estão interessados no produto e estão dispostos a experimentá-lo por um período mais longo.
- Tempo médio de uso do produto durante o período de trial: Essa métrica ajuda a entender se os usuários estão usando o produto de forma adequada e se estão aproveitando todas as funcionalidades oferecidas.
- Número de funcionalidades usadas durante o período de trial: Essa métrica é importante para identificar quais funcionalidades são mais interessantes para os usuários e quais podem ser melhoradas.
- Índice de satisfação dos usuários com o produto durante o período de trial: Essa métrica é importante para entender como os usuários estão avaliando o produto e se estão satisfeitos com ele.

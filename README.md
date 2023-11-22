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

- Clinicas que usam financiamento real podem ser removidas da análise de conversão de assinaturas
- observar colunas:
  - `business_segmentation is not "Rede Homologada"`
  - `is_chain_clinic is not true`.

### Tabela subscriptions

Contém informações de **assinaturas** de clínicas. A assinatura é definida como o início de um esquema de pagamentos recorrentes, possuindo início, data de fim (caso tenha sido encerrada) e a recorrência de pagamentos. Se uma clínica começar uma assinatura, encerrar ela e depois voltar a ser assinante, ela terá múltiplas linhas de assinatura.

### Tabela activity

Registra todas as **atividades** realizadas pela clínica, contendo registros temporais de quando a clínica desempenhou uma determinada ação. Temos diversos tipos de atividades no produto, que por sua vez estão organizadas em níveis hierarquicos para facilitar nosso trabalho com elas. Esses níveis estão disponíveis nas features:

- module
- analytics_domain
- feature
- As atividades realizadas apenas em período de trial.

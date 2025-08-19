# Sistema de Previsão de Duração de Viagens - Matrix Tracking 

## Sobre o Projeto

Este projeto desenvolve um sistema de inteligência artificial para prever a duração de viagens de veículos de carga, parte do produto **Matrix Tracking**. O sistema utiliza dados de coordenadas geográficas e timestamps para estimar com precisão o tempo necessário para completar trajetos, otimizando rotas e melhorando a eficiência logística.

##  Dados

O conjunto de dados consiste em registros de viagens com:
- Coordenadas de origem (latitude/longitude)
- Coordenadas de destino (latitude/longitude)
- Timestamp da viagem
- Duração real da viagem (target para treino)

##  Raciocínio Lógico

A abordagem para o desenvolvimento do modelo seguiu o seguinte raciocínio:

### 1. Compreensão do Problema

O problema central é a previsão precisa da duração de viagens com base em dados limitados (apenas coordenadas e timestamps). Isso exigiu uma compreensão profunda dos fatores que influenciam o tempo de viagem:
- Distância entre pontos
- Região geográfica (identificação de padrões específicos)
- Horário do dia (congestionamentos em horários de pico)
- Dia da semana (diferenças entre dias úteis e fins de semana)

### 2. Exploração e Análise dos Dados

A análise exploratória revelou:

- **Padrão bimodal na distribuição geográfica**: Identificação de dois clusters de coordenadas correspondentes a regiões metropolitanas distintas (Nova York e São Francisco)
- **Diferença significativa na duração média**: Viagens em Nova York (20,2 min) são em média 78% mais longas que em São Francisco (11,3 min)
- **Alta dispersão na duração**: Grande variância nos tempos de viagem, mesmo para distâncias similares
- **Valores atípicos**: Presença de durações extremas que exigiram tratamento especial

### 3. Engenharia de Features

Para compensar a limitação dos dados brutos, criamos features derivadas:

**Features Geoespaciais**:
- Distância euclidiana entre origem e destino
- Distância de Manhattan (mais relevante em ambientes urbanos)
- Direção da viagem (bearing)
- Identificação de região (NY vs SF)
- Coordenadas do centro do trajeto

**Features Temporais**:
- Hora do dia
- Dia da semana
- Mês e ano
- Flag para fim de semana
- Flag para horários de pico

**Features Combinadas**:
- Interação entre região e hora
- Interação entre distância e período do dia

### 4. Seleção e Otimização do Modelo

Foram testados múltiplos algoritmos para identificar o melhor para este problema específico:

1. **Linear Regression**: Estabeleceu uma baseline (R² = 0,0195)
2. **Random Forest**: Apresentou overfitting (R² negativo)
3. **Gradient Boosting**: Melhor performance (R² = 0,0278)

O Gradient Boosting foi otimizado via Grid Search, resultando em:
- Learning rate: 0.05
- Max depth: 4
- N estimators: 150
- Subsample: 0.8

### 5. Avaliação e Interpretação

A análise de importância das features revelou os principais fatores que influenciam a duração:
1. **Distância euclidiana**: 11,8%
2. **Direção da viagem**: 10,6%
3. **Distância de Manhattan**: 10,4%
4. **Interação distância-tempo**: 10,3%

O modelo final apresentou:
- RMSE: 3.268,16 segundos (~54,5 minutos)
- MAE: 621,29 segundos (~10,4 minutos)
- R²: 0,0253

Apesar do R² relativamente baixo, o modelo captura padrões importantes e oferece previsões úteis para otimização logística. O valor baixo do R² pode ser explicado pela alta variabilidade inerente aos tempos de viagem urbanos e pela limitação das variáveis disponíveis.

##  Aplicação no Negócio

O modelo desenvolvido se integra ao Matrix Tracking em três componentes principais:

###  Motor de Rotas
- Previsão de tempo em rotas alternativas
- Otimização de sequenciamento de entregas
- Alertas proativos sobre atrasos potenciais

###  Banco de Dados de Trajetórias
- Análise comparativa de performance por região/horário
- Identificação de gargalos recorrentes
- Benchmarks para performance de motoristas

###  Sistema de IA
- Tomada de decisão autônoma sobre rotas ótimas
- Aprendizado contínuo com novos dados
- Detecção de anomalias em tempos de viagem

##  Estrutura do Projeto

```
desafio_machine_learning/
│
├── data/               # Arquivos de dados
│   ├── train.csv       # Dados de treinamento
│   └── test.csv        # Dados de teste
├── output/             # Resultados e predições
│   └── submission.csv  # Arquivo de submissão
|
└── desafio.ipynb       # Notebook principal com análise e modelagem
```


**Autor:** Julia Padilha Da Rosa

**Última atualização:** Agosto 2025

# Instruções para Configuração

Este documento fornece instruções passo a passo para configurar o ambiente e executar o projeto.

## Pré-requisitos

- Python 3.9 ou superior
- pip (gerenciador de pacotes Python)
- Git

## Configuração do Ambiente

1. Clone o repositório (caso seja um repositório privado, será necessário acesso)

```bash
git clone https://github.com/seu-usuario/desafio_machine_learning.git
cd desafio_machine_learning
```

2. Crie e ative um ambiente virtual

```bash
# No macOS/Linux
python -m venv venv
source venv/bin/activate

# No Windows
python -m venv venv
venv\Scripts\activate
```

3. Instale as dependências

```bash
pip install -r requirements.txt
```

## Estrutura de Arquivos

- `desafio.ipynb`: Notebook Jupyter contendo a análise completa e o desenvolvimento do modelo
- `data/`: Pasta com os conjuntos de dados de treino e teste
- `output/`: Pasta com o arquivo de submissão gerado
- `models/`: Pasta para armazenar modelos treinados (caso queira salvar os modelos)

## Executando o Notebook

1. Inicie o Jupyter Notebook:

```bash
jupyter notebook
```

2. Navegue até `desafio.ipynb` e abra-o

3. Execute todas as células do notebook sequencialmente para reproduzir a análise e os resultados

## Notas Importantes

- A execução completa do notebook pode levar alguns minutos, especialmente durante o treinamento dos modelos
- Os arquivos de dados já estão incluídos no diretório `data/`
- O resultado final (previsões) é salvo no arquivo `output/submission.csv`

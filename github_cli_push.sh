#!/bin/bash

# Script para criar e enviar o repositório usando GitHub CLI (gh)
# Certifique-se de ter o GitHub CLI instalado: https://cli.github.com/

# Configurações
REPOSITORY_NAME="desafio_machine_learning"
DESCRIPTION="Projeto de Machine Learning para prever a duração de viagens"
VISIBILITY="private"

# Verificar se o GitHub CLI está instalado
if ! command -v gh &> /dev/null; then
    echo "GitHub CLI não encontrado. Por favor, instale-o primeiro:"
    echo "Instruções: https://cli.github.com/"
    exit 1
fi

# Verificar login no GitHub
echo "Verificando autenticação GitHub..."
if ! gh auth status &> /dev/null; then
    echo "Você precisa fazer login no GitHub CLI primeiro:"
    gh auth login
fi

# Criar o repositório (se não existir)
echo "Criando repositório no GitHub (ou usando existente)..."
gh repo create $REPOSITORY_NAME --description="$DESCRIPTION" --$VISIBILITY || echo "Repositório já existe ou ocorreu um erro"

# Configurar o remote
echo "Configurando remote..."
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/$(gh api user | jq -r .login)/$REPOSITORY_NAME.git"

# Adicionar todos os arquivos
echo "Adicionando arquivos..."
git add -A

# Criar commit
echo "Criando commit..."
git commit -m "Atualização: $(date '+%Y-%m-%d %H:%M:%S')" || echo "Nada para commitar"

# Push forçado
echo "Enviando para GitHub (apenas versão mais recente)..."
git push -u origin main --force

echo "===================================================="
echo "Seu código foi atualizado no GitHub!"
echo "Apenas a versão mais recente está disponível agora."
echo "Acesse: https://github.com/$(gh api user | jq -r .login)/$REPOSITORY_NAME"
echo "===================================================="

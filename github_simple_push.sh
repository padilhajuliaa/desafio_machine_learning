#!/bin/bash

# Script simples para enviar o repositório para o GitHub usando HTTPS básico
# Este script solicitará seu nome de usuário e senha/token quando necessário

# Configurações
GITHUB_USERNAME="padilhajuliaa"
REPOSITORY_NAME="desafio_machine_learning"

echo "Este script enviará seu projeto para o GitHub."
echo "Antes de executar, certifique-se de que você:"
echo "1. Criou um repositório privado vazio chamado '$REPOSITORY_NAME' no GitHub"
echo "2. Tem seu nome de usuário e senha/token pessoal do GitHub prontos"
echo ""
echo "Continuar? (s/n)"
read CONFIRM

if [[ "$CONFIRM" != "s" && "$CONFIRM" != "S" ]]; then
    echo "Operação cancelada."
    exit 0
fi

# Configurar o remote
echo "Configurando remote..."
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/$GITHUB_USERNAME/$REPOSITORY_NAME.git"

# Garantir que estamos na branch main
git branch -M main

# Adicionar todos os arquivos
echo "Adicionando arquivos..."
git add -A

# Criar commit
echo "Criando commit..."
git commit -m "Atualização: $(date '+%Y-%m-%d %H:%M:%S')" || echo "Nada para commitar"

# Push forçado
echo "Enviando para GitHub (apenas versão mais recente)..."
echo "Quando solicitado, insira seu nome de usuário e senha/token pessoal do GitHub."
git push -u origin main --force

echo "===================================================="
echo "Se não houve erros, seu código foi atualizado no GitHub!"
echo "Apenas a versão mais recente está disponível agora."
echo "Acesse: https://github.com/$GITHUB_USERNAME/$REPOSITORY_NAME"
echo "===================================================="

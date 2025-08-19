#!/bin/bash

# Script para atualizar o repositório do GitHub com a última versão
# Execute este script para atualizar ou criar seu repositório privado no GitHub

# Substitua com seu nome de usuário e nome do repositório no GitHub
# Se o repositório ainda não existir, ele será criado automaticamente

GITHUB_USERNAME=padilhajuliaa
REPOSITORY_NAME=desafio_machine_learning

# Verifica se já existe um remote origin configurado
if git remote | grep -q "^origin$"; then
    echo "Remote 'origin' já existe. Atualizando configuração..."
    git remote set-url origin https://github.com/${GITHUB_USERNAME}/${REPOSITORY_NAME}.git
else
    echo "Configurando novo remote 'origin'..."
    git remote add origin https://github.com/${GITHUB_USERNAME}/${REPOSITORY_NAME}.git
fi

# Garantir que estamos na branch main
git branch -M main

# Adicionar todas as alterações recentes
git add -A

# Criar um commit com as alterações mais recentes
echo "Criando commit com as alterações mais recentes..."
git commit -m "Atualização: $(date '+%Y-%m-%d %H:%M:%S')"

# Push forçado para garantir que apenas a versão atual esteja no GitHub
echo "Enviando para GitHub (apenas a versão mais recente)..."
git push -u origin main --force

echo "===================================================="
echo "Seu código foi atualizado no GitHub!"
echo "Apenas a versão mais recente está disponível agora."
echo "Acesse: https://github.com/${GITHUB_USERNAME}/${REPOSITORY_NAME}"
echo "===================================================="
echo ""
echo "Para configurar acesso privado:"
echo "1. No GitHub, vá para seu repositório"
echo "2. Navegue até 'Settings' > 'Manage Access'"
echo "3. Clique em 'Invite a collaborator' para adicionar pessoas específicas"
echo "4. Ou clique em 'Create private link' para gerar um link de acesso"
echo "===================================================="

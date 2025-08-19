#!/bin/bash

# Script temporário para enviar o projeto usando token de acesso pessoal
# Execute este script e siga as instruções

echo "==================================================================="
echo "Para criar um Personal Access Token no GitHub:"
echo "1. Acesse: https://github.com/settings/tokens"
echo "2. Clique em 'Generate new token' > 'Generate new token (classic)'"
echo "3. Dê um nome como 'ML Project Push'"
echo "4. Selecione o escopo 'repo' (acesso completo aos repositórios)"
echo "5. Clique em 'Generate token'"
echo "6. COPIE o token gerado (você não o verá novamente!)"
echo "==================================================================="
echo ""

read -p "Você já criou o repositório 'desafio_machine_learning' no GitHub? (s/n): " REPO_EXISTS

if [[ "$REPO_EXISTS" != "s" && "$REPO_EXISTS" != "S" ]]; then
    echo "Por favor, crie o repositório primeiro em: https://github.com/new"
    echo "Nome: desafio_machine_learning"
    echo "Tipo: Private"
    echo "NÃO inicialize com README, .gitignore ou License"
    echo ""
    echo "Execute este script novamente após criar o repositório."
    exit 1
fi

read -p "Digite seu nome de usuário do GitHub: " GITHUB_USERNAME
read -sp "Cole seu Personal Access Token: " GITHUB_TOKEN
echo ""

# Configurar o remote com o token no URL
REMOTE_URL="https://${GITHUB_USERNAME}:${GITHUB_TOKEN}@github.com/${GITHUB_USERNAME}/desafio_machine_learning.git"
git remote set-url origin "$REMOTE_URL"

echo "Enviando para o GitHub..."
git push -u origin main --force

# Limpar o token da URL (por segurança)
git remote set-url origin "https://github.com/${GITHUB_USERNAME}/desafio_machine_learning.git"

echo ""
echo "Se não houver erros acima, seu projeto foi enviado com sucesso!"
echo "Acesse: https://github.com/${GITHUB_USERNAME}/desafio_machine_learning"

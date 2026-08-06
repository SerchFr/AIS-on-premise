#!/bin/bash
set -e

USER_NAME="${SAMBA_USER:-sambauser}"
USER_PASS="${SAMBA_PASS:-sambauser}"

echo "=== Démarrage du conteneur Samba ==="

# --- 1. Le compte Linux ---
if ! id "$USER_NAME" &>/dev/null; then
    echo "Création du compte Linux : $USER_NAME"
    useradd -M -s /usr/sbin/nologin "$USER_NAME"
else
    echo "Compte Linux déjà présent : $USER_NAME"
fi

# --- 2. Le compte Samba ---
if ! pdbedit -L 2>/dev/null | grep -q "^${USER_NAME}:"; then
    echo "Création du compte Samba : $USER_NAME"
    printf '%s\n%s\n' "$USER_PASS" "$USER_PASS" | smbpasswd -s -a "$USER_NAME"
else
    echo "Compte Samba déjà présent : $USER_NAME"
fi

# --- 3. Le dossier partagé ---
mkdir -p /srv/samba/data
chown "$USER_NAME":"$USER_NAME" /srv/samba/data
chmod 2775 /srv/samba/data

# --- 4. Vérification de la configuration ---
testparm -s > /dev/null

# --- 5. Lancement ---
echo "=== Samba démarre ==="
exec smbd --foreground --no-process-group

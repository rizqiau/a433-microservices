#!/bin/bash
# Script untuk build dan push Docker image untuk karsajobs-ui (frontend)

# Ganti nilai di bawah ini dengan username Docker Hub Anda
DOCKER_USERNAME="rizqiau"

echo "Mem-build Docker image untuk karsajobs-ui..."
# Perintah untuk build Docker image dari Dockerfile di direktori saat ini.
docker build -t $DOCKER_USERNAME/karsajobs-ui:latest .

echo "Login ke Docker Hub..."
# Perintah untuk login ke Docker Hub.
# Gunakan kredensial dari environment variable untuk keamanan.
# Pastikan Anda sudah menjalankan 'export DOCKER_PASSWORD=<password_Anda>' di terminal.
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

echo "Push Docker image ke Docker Hub..."
# Perintah untuk push image ke Docker Hub.
docker push $DOCKER_USERNAME/karsajobs-ui:latest

echo "Proses selesai untuk karsajobs-ui."
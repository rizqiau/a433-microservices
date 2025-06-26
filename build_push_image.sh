#!/bin/bash

# =================================================================
# Script untuk Build dan Push Docker Image ke Docker Hub
# =================================================================

# Memberikan penjelasan dalam bentuk komentar untuk setiap perintah.

# Variabel untuk username Docker Hub Anda.
DOCKERHUB_USERNAME="rizqiau"

# Kriteria: Perintah untuk membuat Docker image dari Dockerfile.
# Nama image: item-app, tag: v1
echo "Membangun Docker image item-app:v1..."
docker build -t item-app:v1 .
echo "Build selesai."
echo "----------------------------------------"

# Kriteria: Melihat daftar image di lokal untuk verifikasi.
echo "Menampilkan daftar Docker images..."
docker images
echo "----------------------------------------"

# Kriteria: Mengubah nama image agar sesuai dengan format Docker Hub.
# Format: <username>/<repository>:<tag>
echo "Memberi tag pada image untuk Docker Hub..."
docker tag item-app:v1 $DOCKERHUB_USERNAME/item-app:v1
echo "Tagging selesai. Image baru: $DOCKERHUB_USERNAME/item-app:v1"
echo "----------------------------------------"

# Kriteria: Login ke Docker Hub via Terminal.
# Menggunakan password dari environment variable PASSWORD_DOCKER_HUB.
echo "Login ke Docker Hub..."
echo $PASSWORD_DOCKER_HUB | docker login -u $DOCKERHUB_USERNAME --password-stdin
echo "Login berhasil."
echo "----------------------------------------"

# Kriteria: Mengunggah image ke Docker Hub.
echo "Mengunggah image ke Docker Hub..."
docker push $DOCKERHUB_USERNAME/item-app:v1
echo "Push selesai."
echo "========================================="
echo "Script berhasil dijalankan!"
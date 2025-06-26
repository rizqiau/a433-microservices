# Kriteria: Menggunakan base image Node.js versi 14
# Ini adalah fondasi dari image kita, berisi Node.js dan NPM.
FROM node:14

# Kriteria: Menentukan working directory untuk container
# Semua perintah selanjutnya akan dijalankan dari direktori /app di dalam container.
WORKDIR /app

# Kriteria: Menyalin seluruh source code ke working directory
# Menyalin semua file dari direktori lokal (tempat Dockerfile berada) ke /app di dalam container.
COPY . .

# Kriteria: Menentukan environment variable untuk production mode dan database host
# NODE_ENV=production memberitahu Node.js untuk berjalan dalam mode produksi (lebih cepat dan efisien).
# DB_HOST=item-db memberitahu aplikasi kita bahwa hostname untuk database MongoDB adalah 'item-db'.
# Nama 'item-db' ini akan kita definisikan nanti di docker-compose.yml.
ENV NODE_ENV=production DB_HOST=item-db

# Kriteria: Menginstal dependencies untuk production dan build aplikasi
# "npm install --production" hanya menginstal dependensi yang dibutuhkan untuk produksi (bukan devDependencies).
# "--unsafe-perm" terkadang dibutuhkan untuk menghindari masalah perizinan saat instalasi.
# "npm run build" menjalankan script 'build' dari package.json untuk menyiapkan aplikasi.
RUN npm install --production --unsafe-perm && npm run build

# Kriteria: Ekspos port yang digunakan oleh aplikasi
# Memberitahu Docker bahwa container ini akan "mendengarkan" koneksi pada port 8080.
EXPOSE 8080

# Kriteria: Menjalankan server saat container diluncurkan
# Ini adalah perintah default yang akan dijalankan saat container dimulai.
# "npm start" akan menjalankan script 'start' dari package.json untuk menyalakan server aplikasi.
CMD ["npm", "start"]
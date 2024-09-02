# Aplikasi Translate

Aplikasi Translate ini adalah sebuah aplikasi multi-platform yang memungkinkan pengguna untuk menerjemahkan teks dari satu bahasa ke bahasa lain menggunakan layanan DeepL.

## Fitur Utama

- Terjemahan teks antar berbagai bahasa
- Antarmuka pengguna yang intuitif dengan Flutter
- Kemampuan input suara untuk menerjemahkan ucapan

## Struktur Proyek

```plaintext
.
├── be
│   ├── controllers
│   ├── models
│   ├── routes
│   ├── app.js
│   └── ...
├── fe
│   ├── lib
│   │   ├── controllers
│   │   ├── models
│   │   ├── screens
│   │   ├── services
│   │   └── main.dart
│   └── ...
├── README.md
└── ...
```

## Instalasi dan Penggunaan

1. **Clone the repository**

  ```bash
  git clone https://github.com/Motherbloods/Translate-app.git
  cd Translate-app
  ```

2. **Instal dependencies untuk backend (Node JS)**:

  ```bash
  cd be
  npm install
  ```

3. **Instal dependencies untuk frontend (Flutter)**:

  ```bash
  cd fe
  flutter pub get
  ```

4. Atur variabel lingkungan di file `.env`
5. Jalankan server backend:

  ```bash
  node app.js
  ```

6. Jalankan aplikasi Flutter:

  ```bash
  flutter run
  ```

## Kontribusi
Kontribusi selalu diterima dengan baik. Silakan buat pull request atau buka issue untuk saran dan perbaikan.

## Kontak
[Habib Risky Kurniawan] - [motherbloodss

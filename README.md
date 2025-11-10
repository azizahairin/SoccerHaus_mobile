# 🏈 Tugas 7 — Elemen Dasar Flutter (SoccerHaus)

## 1. Apa itu Widget Tree dan Hubungan Parent–Child
Widget tree adalah struktur pohon yang menunjukkan bagaimana widget tersusun di aplikasi Flutter.  
Widget paling luar disebut **parent (induk)** dan widget di dalamnya disebut **child (anak)**.  
Parent mengatur tata letak, tampilan, dan perilaku dari widget anak di dalamnya.

---

## 2. Widget yang Digunakan dan Fungsinya
- **MaterialApp** → Pembungkus utama aplikasi, mengatur tema dan halaman awal.  
- **Scaffold** → Menyediakan struktur dasar halaman (AppBar dan body).  
- **AppBar** → Menampilkan judul aplikasi di bagian atas.  
- **Padding** → Memberi jarak antar elemen agar tampilan rapi.  
- **Column** → Menyusun widget secara vertikal.  
- **Row** → Menyusun widget secara horizontal.  
- **Center** → Menempatkan widget di tengah layar.  
- **Text** → Menampilkan teks.  
- **Card** → Menampilkan informasi dalam bentuk kartu.  
- **GridView.count** → Membuat layout grid untuk tombol produk.  
- **Icon** → Menampilkan ikon pada tombol.  
- **Material** → Pembungkus efek visual (warna, sudut, elevasi).  
- **InkWell** → Menangani aksi klik dengan efek ripple.  
- **SnackBar** → Menampilkan pesan singkat di bawah layar.

---

## 3. Fungsi Widget MaterialApp
`MaterialApp` adalah widget root yang menyiapkan struktur aplikasi Flutter dengan gaya Material Design.  
Widget ini mengatur tema warna, judul aplikasi, serta halaman utama (`home`).  
Biasanya digunakan sebagai root karena semua widget di bawahnya membutuhkan konteks tema dan navigasi dari `MaterialApp`.

---

## 4. Perbedaan StatelessWidget dan StatefulWidget
- **StatelessWidget** → Tidak memiliki data yang bisa berubah. Cocok untuk tampilan statis seperti teks dan ikon.  
- **StatefulWidget** → Memiliki data (state) yang bisa berubah dan memperbarui tampilan. Cocok untuk form, animasi, atau data dinamis.  

Pada tugas ini digunakan **StatelessWidget**, karena tampilan tidak berubah selama aplikasi berjalan.

---

## 5. Apa itu BuildContext dan Mengapa Penting
`BuildContext` adalah objek yang menyimpan posisi widget di dalam widget tree.  
Dengan `BuildContext`, Flutter tahu di mana widget berada dan bisa mengakses:
- Tema dari `MaterialApp`
- Navigator (untuk pindah halaman)
- ScaffoldMessenger (untuk menampilkan `SnackBar`)  

Metode `build()` menggunakan `BuildContext` agar Flutter bisa merender widget dengan benar.

---

## 6. Konsep "Hot Reload" dan "Hot Restart"
- **Hot Reload** → Memperbarui tampilan tanpa menghapus state aplikasi. Cocok untuk mengubah UI cepat.  
- **Hot Restart** → Menjalankan ulang seluruh aplikasi dan menghapus semua state. Cocok saat ada perubahan besar di kode.  

---

# ⚽️ Tugas 8 — Flutter Navigation, Layouts, Forms, and Input Elements (SoccerHaus)

## 1. Perbedaan Navigator.push() dan Navigator.pushReplacement()
`Navigator.push()` menambahkan halaman baru di atas stack halaman yang sedang aktif, sehingga pengguna masih bisa kembali ke halaman sebelumnya dengan tombol **Back**.  
Sedangkan `Navigator.pushReplacement()` menggantikan halaman yang sedang aktif dengan halaman baru, jadi halaman lama dihapus dari stack dan tidak bisa kembali ke sana.  

Pada aplikasi:
- `Navigator.push()` digunakan saat membuka halaman **Create Product** dari halaman utama, agar pengguna bisa kembali ke home setelah selesai mengisi form.  
- `Navigator.pushReplacement()` digunakan pada navigasi dari **drawer**, supaya halaman baru menggantikan halaman sebelumnya dan tidak menumpuk di stack.

---

## 2. Pemanfaatan Hierarchy Widget (Scaffold, AppBar, Drawer)
Struktur halaman dibangun menggunakan **Scaffold** sebagai kerangka utama yang menyediakan area untuk **AppBar**, **body**, dan **Drawer**.  
- **Scaffold** menjaga agar semua halaman memiliki tata letak konsisten.  
- **AppBar** digunakan untuk menampilkan judul aplikasi “SoccerHaus” di setiap halaman.  
- **Drawer** berisi menu navigasi ke halaman **Home Page** dan **Create Product**, sehingga pengguna bisa berpindah halaman dengan mudah.  

---

## 3. Kelebihan Layout Widget: Padding, SingleChildScrollView, dan ListView  
- **Padding** → Memberikan jarak antar elemen agar tidak menempel dan tampak lebih rapi.  
  Contoh: setiap `TextFormField` di halaman form dibungkus `Padding` agar tampil proporsional.  
- **SingleChildScrollView** → Membuat seluruh konten form dapat digulir ke bawah, berguna saat form panjang dan melebihi tinggi layar.  
  Contoh: seluruh elemen input di dalam form dibungkus `SingleChildScrollView` supaya tidak overflow.  
- **ListView** → Cocok untuk menampilkan daftar elemen yang jumlahnya dinamis atau banyak.  

Penggunaan kombinasi ini membuat tampilan form di halaman **Create Product** tetap responsif dan mudah digunakan di berbagai ukuran layar.

---

## 4. Penyesuaian Warna Tema Aplikasi  
Warna tema diatur melalui `ThemeData` di `MaterialApp`, menggunakan skema warna biru (`Colors.blue`) sebagai warna utama dan `Colors.blueAccent[400]` sebagai warna sekunder.  
Pemilihan warna ini menyesuaikan identitas visual brand **Football Shop**.
Dengan tema warna konsisten, seluruh elemen seperti **AppBar**, **button**, dan **ikon** terlihat selaras dan memperkuat branding.

---

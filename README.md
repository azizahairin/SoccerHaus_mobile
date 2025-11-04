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
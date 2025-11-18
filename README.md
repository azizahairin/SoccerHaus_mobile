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

# ⚽️ Tugas 9 — Integrasi Django–Flutter (SoccerHaus)

## 1. Mengapa Kita Perlu Membuat Model Dart Saat Mengambil/Mengirim Data JSON?

Model Dart digunakan supaya data JSON yang diterima Flutter punya bentuk yang jelas dan aman.
Kalau langsung memakai `Map<String, dynamic>` tanpa model:

* **Tidak ada validasi tipe** → data bisa salah tipe tanpa ketahuan.
* **Tidak aman null-safety** → field kosong bisa bikin error runtime.
* **Sulit dirawat** → parsing harus dilakukan di setiap halaman.
* **Tidak konsisten** → kalau Django ubah struktur JSON sedikit, parsing manual langsung rusak.

Dengan model Dart, semua data memiliki tipe yang pasti (int, String, bool), mudah di-debug, dan jauh lebih maintainable.

---

## 2. Fungsi package http dan CookieRequest

**http**
Digunakan untuk melakukan request HTTP biasa yang tidak membutuhkan autentikasi. Tidak menyimpan session atau cookie.

**CookieRequest**
Bagian dari `pbp_django_auth`. Berfungsi untuk melakukan request yang membutuhkan **session login Django**, karena menyimpan dan mengirim cookie session secara otomatis.

**Bedanya:**

* `http` → request tanpa autentikasi
* `CookieRequest` → request yang terhubung dengan sistem login Django dan membawa cookie session

---

## 3. Mengapa Instance CookieRequest Perlu Dibagikan ke Semua Komponen?

Karena `CookieRequest` menyimpan:

* status login user
* cookie session Django
* method login / logout / get / post yang aman

Jika instance-nya tidak dibagikan lewat Provider:

* halaman lain tidak tahu apakah user sedang login
* session tidak terbawa
* permintaan ke Django akan ditolak
* login/logout menjadi tidak konsisten

Dengan satu instance global, seluruh halaman berbagi status login yang sama dan aplikasi berjalan konsisten.

---

## 4. Konfigurasi Konektivitas Django–Flutter

Agar Flutter dapat berkomunikasi dengan Django, beberapa konfigurasi wajib dilakukan:

### **1. Menambahkan `10.0.2.2` ke ALLOWED_HOSTS**

Android emulator mengakses komputer host melalui `10.0.2.2`.
Jika tidak ditambahkan → Django akan memblokir request sebagai host tidak dikenal.

### **2. Mengaktifkan CORS dan pengaturan cookie / SameSite**

Diperlukan agar Django mengizinkan request dari Flutter dan supaya cookie session bisa terkirim.
Jika tidak diaktifkan:

* Flutter tidak dapat mengambil data JSON
* login selalu gagal karena cookie tidak terkirim

### **3. Menambahkan izin internet di Android**

Di `AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

Tanpa izin ini, Flutter tidak bisa membuat request jaringan sama sekali.

Jika salah satu konfigurasi di atas tidak benar, Flutter tidak akan bisa berkomunikasi dengan Django secara penuh.

---

## 5. Mekanisme Pengiriman Data dari Input ke Tampilan Flutter

1. User mengisi form di Flutter.
2. Flutter mengirim data ke Django menggunakan `CookieRequest.postJson()`.
3. Django memproses data dan menyimpannya ke database.
4. Flutter mengambil data kembali melalui endpoint JSON dengan `request.get()`.
5. Data JSON diubah menjadi model Dart.
6. Data ditampilkan dalam widget seperti Card atau ListView.

Alurnya sederhana: **input → kirim → simpan → fetch → tampilkan**.

---

## 6. Mekanisme Autentikasi (Login, Register, Logout)

### **Login**
1. Flutter mengirim username & password ke Django Auth.
2. Django mengecek kredensial.
3. Jika benar, Django mengirim cookie session.
4. CookieRequest menyimpan cookie tersebut.
5. Flutter membuka menu utama.
### **Register**
1. Flutter mengirim data akun baru ke Django.
2. Django membuat user baru.
3. Flutter menampilkan pesan sukses dan redirect ke login.
### **Logout**
1. Flutter memanggil endpoint logout Django.
2. Django menghapus session.
3. CookieRequest menghapus cookie lokal.
4. Flutter kembali ke halaman login.

## 7. Implementasi Checklist Secara Step-by-Step
1. **Setup project Flutter** (struktur folder, MaterialApp, routing).
2. **Install dan konfigurasi pbp_django_auth** lalu wrap dengan Provider.
3. **Membuat model Dart** supaya parsing JSON aman.
4. **Menghubungkan Django ↔ Flutter**
   * Set ALLOWED_HOSTS
   * Atur CORS
   * Nyalakan internet permission
5. **Mengimplementasikan halaman Login & Register**
   * Form validasi
   * Request login/register → cek response
   * Redirect ke menu utama
6. **Mendesain halaman Menu, Drawer, dan Navigasi**
7. **Form Create Product**
   * Validasi input
   * Kirim ke Django dengan postJson
8. **Product List & Product Details**
   * Ambil data JSON
   * Ubah ke model Dart
   * Tampilkan pakai ListView + Card
9. **Desain ulang aplikasi**
10. **Testing**
    * Coba tambah produk
    * Coba login/logout
    * Cek apakah data tampil benar & desain konsisten

---

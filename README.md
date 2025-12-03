1. Halaman Home berisi daftar kategori (Makanan, Minuman, Camilan)
   <img width="497" height="722" alt="image" src="https://github.com/user-attachments/assets/ad5d6737-8847-45f6-9dbf-0657d47a4415" />

2. Saat kategori ditekan, aplikasi pindah ke halaman ProductList, menampilkan daftar produk dalam bentuk Grid.
   <img width="497" height="724" alt="image" src="https://github.com/user-attachments/assets/a644f000-983a-42e6-9877-8c21d504f158" />
   <img width="499" height="723" alt="image" src="https://github.com/user-attachments/assets/828f9833-61a3-464d-a663-d157aa52662b" />
   <img width="498" height="730" alt="image" src="https://github.com/user-attachments/assets/6b24d1e0-1eeb-47df-be6b-e9e3f939766a" />

3. Salah satu produk diklik, aplikasi berpindah ke ProductDetail yang hanya menampilkan ikon produk, nama, dan harganya.
   <img width="811" height="724" alt="image" src="https://github.com/user-attachments/assets/e46e5c25-b452-44ba-acc3-150837d11164" />
   <img width="811" height="723" alt="image" src="https://github.com/user-attachments/assets/ecafed32-a28c-4467-bea3-fec5ad2e798b" />
   <img width="807" height="727" alt="image" src="https://github.com/user-attachments/assets/8ededfd8-43b3-4e38-91f3-c3f16d3cd072" />

4. Tulis widget yang digunakan dalam membangun project tersebut beserta fungsinya!
   1. MaterialApp, Fungsi: Root aplikasi Flutter berbasis Material Design, mengatur tema dan route.
   2. Scaffold, Fungsi: Struktur dasar halaman (memiliki AppBar, body, floating button, dll).
   3. AppBar, Fungsi: Menampilkan bar header di atas halaman (judul halaman).
   4. GridView.count, Fungsi: Menampilkan data dalam bentuk grid (kotak-kotak), cocok untuk kategori atau produk.
   5. GridView.builder, Fungsi: Membuat grid secara dinamis berdasarkan jumlah item produk.
   6. Card, Fungsi: Membuat tampilan berbentuk kartu untuk item kategori atau item produk.
   7. InkWell / GestureDetector, Fungsi: Menangani aksi ketika item ditekan (onTap → pindah halaman).
   8. Container, Fungsi: Membungkus widget lain serta memberi margin, padding, warna, dan styling.
   9. Padding, Fungsi: Memberi jarak di dalam widget (inner spacing).
   10. SizedBox, Fungsi: Mengatur tinggi/lebar kosong sebagai jarak antar elemen.
   11. Image.asset, Fungsi: Menampilkan gambar dari folder lokal /assets/images.
   12. Text, Fungsi: Menampilkan teks seperti nama produk, harga, atau judul kategori.
   13. ListTile, Fungsi: Menampilkan item dalam bentuk list dengan pattern: leading – title – subtitle – trailing.
   14. ClipRRect, Fungsi: Membuat sudut gambar menjadi rounded (membulat).
   15. Navigator.push, Fungsi: Pindah halaman (Home → ProductList → ProductDetail).
   16. Column, Fungsi: Menyusun elemen secara vertikal dalam detail produk.
   17. Row, Fungsi: Menyusun elemen secara horizontal (biasanya untuk harga + tombol).
   18. ElevatedButton, Fungsi: Tombol utama, misalnya tombol “Add to Cart”.
   19. Expanded, Fungsi: Memperbesar widget agar memenuhi ruang yang tersisa di layout.
   20. SingleChildScrollView, Fungsi: Membuat halaman bisa discroll agar konten panjang tidak overflow.





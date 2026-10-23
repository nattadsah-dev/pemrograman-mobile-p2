# PEMROGRAMAN MOBILE PERTEMUAN 2

Nama: Natasha Patricia Nainggolan
NIM: 4243550006
Kelas: PSIK 24C

program kasir console berbasis dart berisi katalog oleh-oleh khas medan, pengurai pesanan dari satu baris teks, dan struk dengan diskon.

## Cara Menjalankan
menjalankan perintah 'dart run' di terminal visual studio code.

## Katalog
  'P01': (nama: 'Bika Ambon', harga: 50000, kategori: 'Kue')
  'P02': (nama: 'Amanda', harga: 50000, kategori: 'Kue')
  'P03': (nama: 'Teri Medan', harga: 40000, kategori: 'Ikan Asin')
  'P04': (nama: 'Ikan Sale', harga: 45000, kategori: 'Ikan Asin')
  'P05': (nama: 'Lemang', harga: 30000, kategori: 'Makanan')
  'P06': (nama: 'Lapis Legit', harga: 120000, kategori: 'Kue')

Katalog disimpan sebagai `Map<String, record>`: kunci berupa kode produk, nilainya record `(nama, harga, kategori)`.

## Skenario 1: Diskon aktif + satu pesanan tidak valid
Input: `P01x1, P02x3, P03x2, P07X1`
Output:
Pesanan: P01x1, P02x3, P03x2, P07X1

Bika Ambon               1 x    50000
Amanda                   3 x   150000
Teri Medan               2 x    80000
Total                          280000
Diskon 10%                      28000
Bayar                          252000
Kategori : Kue, Ikan Asin
Diabaikan: P07X1

- subtotal: 50000 + 150000 + 80000 = 280000. Karena 280000 >= 100000, diskon 10% = 28000 sehingga bayar 252000.
- `P07X1` diabaikan. kodenya (`P07`) tidak ada di katalog dan pemisahnya memakai `X` huruf besar sedangkan program memisah dengan ` kecil sehingga item itu tidak terurai menjadi dua bagian.
- Kategori `Kue` muncul sekali meskipun ada dua produk Kue karena memakai `Set`.

## Skenario 2: Tanpa diskon + banyak input salah
Input: `P05x1, P99x3, abc, P04xabc`
Output:
Pesanan: P05x1, P99x3, abc, P04xabc

Lemang                   1 x    30000
Total                           30000
Diskon 10%                          0
Bayar                           30000
Kategori : Makanan
Diabaikan: P99x3, abc, P04xabc

- hanya `P05x1` yang valid. total 30000 < 100000 jadi tidak ada diskon.
- kode `P99x3`tidak ada di katalog sehingga `katalog['P99']` bernilai `null`.
- `abc`: tidak punya pola kode x jumlah jadi hasil `split('x')` bukan dua bagian.
- kode `P04xabc` valid tetapi jumlahnya `'abc'`, sehingga `int.tryParse` menghasilkan `null`.

## var, final, dan const
- `var`yaitu variabel yang nilainya boleh diganti dan tipenya ditebak otomatis. program ini tidak memakai `var` karena tidak ada nilai yang perlu diubah ulang.
- `final` yaotu nilainya ditetapkan sekali saat program berjalan lalu tidak bisa diganti. dipakai pada `katalog`, `item`, `diabaikan`, `total`, `diskon`, dan `kategori`. contohnya `total` baru diketahui setelah perhitungan jadi tidak bisa `const`.
- `const` yaitu nilainya sudah pasti sejak sebelum program berjalan (compile-time). dipakai pada `const input = '...'` karena teks pesanan sudah tetap sejak ditulis.
- isi `item` dan `diabaikan` masih bisa ditambah (`add`) walau dideklarasikan `final` karena `final` hanya mengunci variabelnya supaya tidak diarahkan ke list lain dan bukan mengunci isi list.

## Null Safety
dart membedakan tipe yang boleh `null` (`int?`) dan yang tidak (`int`) sehingga kesalahan `null` ketahuan sebelum program dijalankan.

- `?` (nullable): `int.tryParse(...)` bertipe `int?`, dan `katalog[kode]` bertipe record nullable. keduanya bisa `null` (kode tidak ada, atau teks bukan angka).
- pengecekan `null`: sebelum dipakai hasilnya diperiksa dengan `if (produk == null || jumlah == null || jumlah <= 0)`. apabila salah satu `null`, item dimasukkan ke `diabaikan` dan program lanjut (`continue`) sehingga kode salah tidak membuat crash.
- `??` (nilai cadangan): tidak dipakai di program ini karena kasus `null` ditangani dengan `if`.
- `!` (null assertion): dipakai satu kali pada `katalog[e.kode]!` di bagian struk. artinya "saya jamin nilai ini tidak null". apabila jaminan ini salah, program akan crash saat runtime. karena itu `!` hanya dipakai setelah `null` diperiksa di tempat lain.

## Pernyataan Penggunaan AI
saya menggunakan AI (Claude untuk untuk memahami konsep map, record, null safety, `map`/`fold`/`Set`dan langkah pengerjaan kode. git dan hasil saya uji coba sendiri.

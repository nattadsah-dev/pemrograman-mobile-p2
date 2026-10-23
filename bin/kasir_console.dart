final katalog = <String, ({String nama, int harga, String kategori})>{
  'P01': (nama: 'Kopi Sidikalang 250 g', harga: 45000, kategori: 'Minuman'),
  'P02': (nama: 'Bolu Meranti', harga: 80000, kategori: 'Kue'),
  'P03': (nama: 'Amanda', harga: 80000, kategori:'Kue')
};

void main() {
  katalog.forEach((kode, produk) {
    print('$kode  ${produk.nama.padRight(24)} ${produk.harga}');
  });
}
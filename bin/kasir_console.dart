final katalog = <String, ({String nama, int harga, String kategori})>{
  'P01': (nama: 'Kopi Sidikalang 250 g', harga: 45000, kategori: 'Minuman'),
  'P02': (nama: 'Bolu Meranti', harga: 80000, kategori: 'Kue'),
  'P03': (nama: 'Amanda', harga: 80000, kategori:'Kue')
};

void main() {
  const input = 'P01x2, P02x1, P09x3';

  final item = <({String kode, int jumlah})>[];
  final diabaikan = <String>[];

  for (final bagian in input.split(',')) {
    final teks = bagian.trim();
    final pecah = teks.split('x');

    if (pecah.length != 2) {
      diabaikan.add(teks);
      continue;
    }

    final kode = pecah[0].trim().toUpperCase();
    final jumlah = int.tryParse(pecah[1].trim());
    final produk = katalog[kode];

    if (produk == null || jumlah == null || jumlah <= 0) {
      diabaikan.add(teks);
      continue;
    }

    item.add((kode: kode, jumlah: jumlah));
  }

  print('Valid    : $item');
  print('Diabaikan: $diabaikan');
}
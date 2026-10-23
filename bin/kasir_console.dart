final katalog = <String, ({String nama, int harga, String kategori})>{
  'P01': (nama: 'Bika Ambon', harga: 50000, kategori: 'Kue'),
  'P02': (nama: 'Amanda', harga: 50000, kategori: 'Kue'),
  'P03': (nama: 'Teri Medan', harga: 40000, kategori: 'Ikan Asin'),
  'P04': (nama: 'Ikan Sale', harga: 45000, kategori: 'Ikan Asin'),
  'P05': (nama: 'Lemang', harga: 30000, kategori: 'Makanan'),
  'P06': (nama: 'Lapis Legit', harga: 120000, kategori: 'Kue'),
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

  final baris = item.map((e) {
    final produk = katalog[e.kode]!;
    return (
      nama: produk.nama,
      jumlah: e.jumlah,
      subtotal: produk.harga * e.jumlah,
      kategori: produk.kategori,
    );
  }).toList();

  final total = baris.fold<int>(0, (akumulator, b) => akumulator + b.subtotal);

  final diskon = total >= 100000 ? total ~/ 10 : 0;

  final kategori = baris.map((b) => b.kategori).toSet();

  print('Pesanan: $input\n');
  for (final b in baris) {
    print('${b.nama.padRight(24)} ${b.jumlah} x ${b.subtotal.toString().padLeft(8)}');
  }
  print('${'Total'.padRight(28)} ${total.toString().padLeft(8)}');
  print('${'Diskon 10%'.padRight(28)} ${diskon.toString().padLeft(8)}');
  print('${'Bayar'.padRight(28)} ${(total - diskon).toString().padLeft(8)}');
  print('Kategori : ${kategori.join(', ')}');
  if (diabaikan.isNotEmpty) print('Diabaikan: ${diabaikan.join(', ')}');
}
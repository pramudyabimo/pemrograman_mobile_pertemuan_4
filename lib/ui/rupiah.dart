String formatRupiah(int? harga) {
  if (harga == null) return 'N/A';

  String angka = harga.toString();
  String hasil = '';
  int hitung = 0;

  for (int i = angka.length - 1; i >= 0; i--) {
    hasil = angka[i] + hasil;
    hitung++;
    if (hitung % 3 == 0 && i != 0) {
      hasil = '.$hasil';
    }
  }

  return 'Rp $hasil';
}

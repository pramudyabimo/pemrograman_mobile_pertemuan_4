import 'package:flutter/material.dart';
import 'package:pertemuan_4/ui/rupiah.dart';

class ProductDetail extends StatefulWidget {
  final String? productCode;
  final String? productName;
  final int? productPrice;

  const ProductDetail({
    Key? key,
    this.productCode,
    this.productName,
    this.productPrice,
  }) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme.primary;
    String nama = widget.productName ?? '';
    if (nama.isEmpty) nama = 'N/A';
    String kode = widget.productCode ?? '';
    if (kode.isEmpty) kode = 'N/A';

    return Scaffold(
      appBar: AppBar(title: const Text('Product Detail')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: warna,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    kode,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  nama,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  formatRupiah(widget.productPrice),
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                _baris('Product Code', kode),
                const Divider(height: 1, indent: 16, endIndent: 16),
                _baris('Product Name', nama),
                const Divider(height: 1, indent: 16, endIndent: 16),
                _baris('Product Price', formatRupiah(widget.productPrice)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _baris(String label, String nilai) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: Text(label, style: const TextStyle(color: Colors.black54)),
          ),
          Text(nilai, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

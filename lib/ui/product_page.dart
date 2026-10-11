import 'package:flutter/material.dart';
import 'package:pertemuan_4/ui/product_detail.dart';
import 'package:pertemuan_4/ui/product_form.dart';
import 'package:pertemuan_4/ui/rupiah.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Page'),
        actionsPadding: const EdgeInsets.only(right: 12.0),
        actions: [
          IconButton.filled(
            icon: const Icon(Icons.add),
            tooltip: 'Tambah produk',
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductForm()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Text(
              'Ketuk salah satu produk untuk melihat detailnya.',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          ItemProduct(
            productCode: "A001",
            productName: "Kulkas",
            productPrice: 2500000,
          ),
          ItemProduct(
            productCode: "A002",
            productName: "TV",
            productPrice: 5000000,
          ),
          ItemProduct(
            productCode: "A003",
            productName: "Mesin Cuci",
            productPrice: 1500000,
          ),
        ],
      ),
    );
  }
}

class ItemProduct extends StatelessWidget {
  final String? productCode;
  final String? productName;
  final int? productPrice;

  const ItemProduct({
    Key? key,
    this.productCode,
    this.productName,
    this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme.primary;
    final nama = productName ?? 'N/A';

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetail(
                productCode: productCode,
                productName: productName,
                productPrice: productPrice,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: warna.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  nama.isEmpty ? '?' : nama[0].toUpperCase(),
                  style: TextStyle(
                    color: warna,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nama,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      productCode ?? 'N/A',
                      style: const TextStyle(color: Colors.black45),
                    ),
                  ],
                ),
              ),
              Text(
                formatRupiah(productPrice),
                style: TextStyle(color: warna, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

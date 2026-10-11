import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pertemuan_4/ui/product_detail.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({Key? key}) : super(key: key);

  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _codeProducTextboxController = TextEditingController();
  final _nameProductTextboxController = TextEditingController();
  final _priceProductTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Form')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Isi data produk baru di bawah ini.',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),
            _textboxCodeProduct(),
            const SizedBox(height: 14),
            _textboxNameProduct(),
            const SizedBox(height: 14),
            _textboxPriceProduct(),
            const SizedBox(height: 24),
            _buttonSave(),
          ],
        ),
      ),
    );
  }

  _textboxCodeProduct() {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Product Code',
        hintText: 'contoh: A004',
      ),
      textCapitalization: TextCapitalization.characters,
      controller: _codeProducTextboxController,
    );
  }

  _textboxNameProduct() {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Product Name',
      ),
      textCapitalization: TextCapitalization.words,
      controller: _nameProductTextboxController,
    );
  }

  _textboxPriceProduct() {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Product Price',
        prefixText: 'Rp ',
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: _priceProductTextboxController,
    );
  }

  _buttonSave() {
    return ElevatedButton(
      onPressed: () {
        String codeProduct = _codeProducTextboxController.text;
        String nameProduct = _nameProductTextboxController.text;
        int? priceProduct = int.tryParse(_priceProductTextboxController.text);

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetail(
              productCode: codeProduct,
              productName: nameProduct,
              productPrice: priceProduct,
            ),
          ),
        );
      },
      child: const Text('Save'),
    );
  }
}

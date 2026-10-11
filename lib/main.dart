import 'package:flutter/material.dart';
import 'package:pertemuan_4/hello_world.dart';
import 'package:pertemuan_4/row_widget.dart';
import 'package:pertemuan_4/column_widget.dart';
import 'package:pertemuan_4/ui/product_page.dart';


void main() {
  runApp(const MyApp());
}

const warnaUtama = Color(0xFF1F4E46);
const warnaLatar = Color(0xFFF4F1EB);
const warnaTeks = Color(0xFF22292B);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertemuan 4 - Pramudya Bimo Pranoto (2031710131)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: warnaUtama,
          primary: warnaUtama,
          surface: warnaLatar,
        ),
        scaffoldBackgroundColor: warnaLatar,
        appBarTheme: const AppBarTheme(
          backgroundColor: warnaLatar,
          foregroundColor: warnaTeks,
          elevation: 0,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
            color: warnaTeks,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          margin: const EdgeInsets.only(bottom: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFFE3DED4)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFD9D3C7)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFD9D3C7)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: warnaUtama, width: 1.5),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: warnaUtama,
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(50),
            elevation: 0,
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      home: const ProductPage(),
    );
  }
}

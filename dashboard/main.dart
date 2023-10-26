import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dashboard/dashboard.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title:"Daftar Produk",
      home: MainHomePage(),
    );
  }
}

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainHomePage();
}

class _MainHomePage extends State<MainHomePage> {
  var listProduk = <Produk>[
    Makanan(nama: 'Bakso', harga: 10000),
    Makanan(nama: 'Mie Ayam', harga: 12000),
    Makanan(nama: 'Gorengan', harga: 500),
    Makanan(nama: 'Lunpia', harga: 1000),
  ];
  TextEditingController namaCtrl = TextEditingController();
  TextEditingController jmlCtrl = TextEditingController();
  String textTotal = '';
  Produk? selectedProduk;

  _MainHomePage() {
    selectedProduk = listProduk[0];
  }

  void setTotal() {
    double harga = selectedProduk!.harga + selectedProduk!.harga;
    setState(() {
      textTotal = harga.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Produk"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right:20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 30),
              child: const Center(
              child: Text(
                'Total Pembelian',
                style: TextStyle (fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const Text("Nama Produk"),
          TextField(controller: namaCtrl),
          const SizedBox(height: 20),
          const Text("Jumlah Produk"),
          TextField(controller: jmlCtrl),
          const SizedBox(height: 20),
          const Text("Total Harga"),
          DropdownButton<Harga>(
            isExpanded: true,
            value: selectedProduk,
            items: listProduk.map((Produk item) {
              return DropdownMenuItem<Harga>(
                value: item, child: Text(item.toString()));
            }).toList(),
            onChanged: (Produk? newVal) {
              setState(() {
                selectedProduk = newVal;
              });
            }),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: setTotal, child: const Text("Hitung Harga"))),
            Text(textTotal)
          ],
        ),
      ),
    );
  }
}
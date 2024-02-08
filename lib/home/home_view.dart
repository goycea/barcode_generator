import 'dart:io';

import 'package:barcode_example/core/contex_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';

import '../core/base.dart';
import 'barcode_generator_page.dart';
import 'barcode_reader_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with Base {
  var snackBar = SnackBar(
    content: Text(''),
  );

  List<File> images = [];
  Future pickImageGalery(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return null;

    final imageTemporary = File(image.path);
    images.add(imageTemporary);
    setState(() {});
  }
  int _selectedIndex = 0;
  static final List<Widget> _pages = <Widget>[
    const BarcodeGeneratorPage(),
    const BarcodeReaderPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorConstant.white,
      appBar: AppBar(
        title: const Text("QR OKUYUCU"),
        backgroundColor: colorConstant.blue,
        centerTitle: false,
      ),
      bottomNavigationBar: Container(
        height: context.dynamicHeight(0.08),
        color: colorConstant.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
              backgroundColor: colorConstant.blue,
              activeColor: colorConstant.white,
              color: colorConstant.white,
              tabBackgroundColor: colorConstant.coldSteel,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              gap: 8,
              iconSize: 35,
              tabBorderRadius: 25,
              padding: const EdgeInsets.all(8),
              tabs: [
                GButton(
                    icon: Icons.add,
                    text: "QR Oluşturucu",
                    textStyle:
                        TextStyle(fontSize: 22, color: colorConstant.white)),
                GButton(
                    icon: Icons.barcode_reader,
                    text: "QR Okuyucu",
                    textStyle:
                        TextStyle(fontSize: 22, color: colorConstant.white)),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              }),
        ),
      ),
      body: Center(child: _pages[_selectedIndex]),
    );
  }
}

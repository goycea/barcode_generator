import 'package:barcode_example/core/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_tts/flutter_tts.dart';

class BarcodeReaderPage extends StatefulWidget {

  @override
  State<BarcodeReaderPage> createState() => _BarcodeReaderPageState();
  const BarcodeReaderPage({Key? key}) : super(key: key);

}

class _BarcodeReaderPageState extends State<BarcodeReaderPage> with Base {
  FlutterTts flutterTts = FlutterTts();
  double volume = 1.0;
  double pitch = 1.0;
  double speechRate = 0.5;
  List<String>? languages;
  String langCode = 'tr-TR';
  String _scanBarcode = 'Bilinmiyor';

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                //When pressed, text to speech will be activated
                onPressed: () async {
                  await flutterTts.setEngine("com.google.android.tts");
                  _speaking(_scanBarcode);},
                icon: Icon(Icons.speaker, color: colorConstant.white), // Barcode icon
                label: const Text('DİNLE'),
                style: ElevatedButton.styleFrom(
                  primary: colorConstant.yellow, // Red background
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30), // Increased padding for bigger button
                ),
              ),
              ElevatedButton.icon(
                  onPressed: () => scanQR(),
                  icon: Icon(Icons.add_a_photo_outlined, color: colorConstant.white),
                  label: const Text('QR TARAMA'),
                  style: ElevatedButton.styleFrom(
                    primary: colorConstant.pomegranateFlowerColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
    )
              ),


              Text('Tarama Sonucu: $_scanBarcode\n',
                  style: TextStyle(fontSize: 20))
            ]));
  }
  //Text to Speech the given string
  Future _speaking(text) async {
    await flutterTts.setLanguage("tr-TR");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }
}

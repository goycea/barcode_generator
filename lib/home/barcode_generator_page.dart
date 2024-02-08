import 'package:barcode_example/core/base.dart';
import 'package:barcode_example/core/contex_extension.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class BarcodeGeneratorPage extends StatefulWidget {
  const BarcodeGeneratorPage({Key? key}) : super(key: key);

  @override
  State<BarcodeGeneratorPage> createState() => _BarcodeGeneratorPageState();
}

class _BarcodeGeneratorPageState extends State<BarcodeGeneratorPage> with Base {
  String? result;
  final TextEditingController seriNoController = TextEditingController();
  final TextEditingController urunAdiController = TextEditingController();
  final TextEditingController hasatYeriController = TextEditingController();
  final TextEditingController hasatTarihiController = TextEditingController();
  final TextEditingController pazarFiyatiController = TextEditingController();
  final TextEditingController hastalikAdiController = TextEditingController();
  final TextEditingController faydaliHastalikAdiController = TextEditingController();
  final TextEditingController besinAdiController = TextEditingController();
  final GlobalKey <FormState> formKey = GlobalKey <FormState> ();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    side: BorderSide(
                        color: colorConstant.black,
                        width: context.dynamicWidth(0.01))),
                color: colorConstant.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BarcodeWidget(
                      data: result.toString(), barcode: Barcode.qrCode()),
                ),
              ),
              SizedBox(
                height: context.dynamicHeight(0.03),
              ),
              TextFormField(
                validator: (value){if (value!.isEmpty){return "bu alan boş bırakılamaz";}},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorConstant.blue,
                      width: 2.0,
                    ),
                  ),
                  labelText: "Seri No",
                  hintText: 'Ürünün seri numarasını yazın',
                ),
                controller: seriNoController,
              ),
              SizedBox(
                height: context.dynamicHeight(0.04),
              ),
              TextFormField(
                validator: (value){if (value!.isEmpty){return "bu alan boş bırakılamaz";}},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorConstant.blue,
                      width: 2.0,
                    ),
                  ),
                  labelText: "Ürün Adı",
                  hintText: 'Ürünün adını yazın',
                ),
                controller: urunAdiController,
              ),
              SizedBox(
                height: context.dynamicHeight(0.04),
              ),
              TextFormField(
                validator: (value){if (value!.isEmpty){return "bu alan boş bırakılamaz";}},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorConstant.blue,
                      width: 2.0,
                    ),
                  ),
                  labelText: "Hasat Yeri",
                  hintText: 'Hasat yerini yazın',
                ),
                controller: hasatYeriController,
              ),
              SizedBox(
                height: context.dynamicHeight(0.04),
              ),
              TextFormField(
                validator: (value){if (value!.isEmpty){return "bu alan boş bırakılamaz";}},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorConstant.blue,
                      width: 2.0,
                    ),
                  ),
                  labelText: "Hasat Tarihi",
                  hintText: 'Hasat tarihini yazın (01.01.1999)',
                ),
                controller: hasatTarihiController,
              ),
              SizedBox(
                height: context.dynamicHeight(0.04),
              ),
              TextFormField(
                validator: (value){if (value!.isEmpty){return "bu alan boş bırakılamaz";}},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorConstant.blue,
                      width: 2.0,
                    ),
                  ),
                  labelText: "Pazar Fiyatı",
                  hintText: 'Pazara çıkış fiyatını yazın (10)',
                ),
                controller: pazarFiyatiController,
              ),
              SizedBox(
                height: context.dynamicHeight(0.04),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorConstant.blue,
                      width: 2.0,
                    ),
                  ),
                  labelText: "Risk Grubu",
                  hintText: 'Ürünün uygun olmadığı hastalık gurubunu yazın',
                ),
                controller: hastalikAdiController,
              ),
              SizedBox(
                height: context.dynamicHeight(0.04),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorConstant.blue,
                      width: 2.0,
                    ),
                  ),
                  labelText: "Ürünün Faydalı Olduğu Hastalık Grubu",
                  hintText: 'Ürünün faydalı olduğu hastalık gurubunu yazın',
                ),
                controller: faydaliHastalikAdiController,
              ),
              SizedBox(
                height: context.dynamicHeight(0.04),
              ),
              TextFormField(
                validator: (value){if (value!.isEmpty){return "bu alan boş bırakılamaz";}},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorConstant.blue,
                      width: 2.0,
                    ),
                  ),
                  labelText: "Besin Adı",
                  hintText: 'Ürünün içerisinde bulunan besini yazın',
                ),
                controller: besinAdiController,
              ),
              SizedBox(
                height: context.dynamicHeight(0.04),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    if (formKey.currentState!.validate()) {
                      if (faydaliHastalikAdiController.text != "" && hastalikAdiController.text == "") {
                        result =
                            "${urunAdiController.text} ürünü, içerdiği ${besinAdiController.text} oranı sebebiyle ${faydaliHastalikAdiController.text} hastalarına iyi gelir. Bu ürün, ${hasatTarihiController.text} tarihinde ${hasatYeriController.text} bölgesinde hasat edilmiştir. Ürün, üreticiden ${pazarFiyatiController.text} ₺ /kg fiyatıyla pazara çıkarılmıştır.";
                      }
                      else if (hastalikAdiController.text != "" && faydaliHastalikAdiController.text == ""){
                        result =
                            "${urunAdiController.text} ürünü, içerdiği ${besinAdiController.text} oranı sebebiyle ${hastalikAdiController.text} hastaları için uygun değildir. Bu ürün, ${hasatTarihiController.text} tarihinde ${hasatYeriController.text} bölgesinde hasat edilmiştir. Ürün, üreticiden ${pazarFiyatiController.text} ₺/kg fiyatıyla pazara çıkarılmıştır.";
                      }
                      else if (hastalikAdiController.text != "" && faydaliHastalikAdiController.text != ""){
                        result =
                            "${urunAdiController.text} ürünü, içerdiği ${besinAdiController.text} oranı sebebiyle ${faydaliHastalikAdiController.text} hastalarına iyi gelir ancak ${hastalikAdiController.text} hastaları için uygun değildir. Bu ürün, ${hasatTarihiController.text} tarihinde ${hasatYeriController.text} bölgesinde hasat edilmiştir. Ürün, üreticiden ${pazarFiyatiController.text} ₺/kg fiyatıyla pazara çıkarılmıştır.";
                      }
                      else{
                        result =
                            "QR hatalı! Girilen ürün için en az bir hastalık grubu girilmeli.";
                      }

                    }
                  });
                },
                child: Text("OLUŞTUR"),
                color: colorConstant.darkBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

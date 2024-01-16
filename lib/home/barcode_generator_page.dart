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
  final TextEditingController seriesIDController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController farmerNameController = TextEditingController();
  final TextEditingController harvestPlaceController = TextEditingController();
  final TextEditingController harvestSeasonController = TextEditingController();
  final TextEditingController riskGroupController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorConstant.blue,
                    width: 2.0,
                  ),
                ),
                labelText: "Series ID",
                hintText: 'Enter Series ID of the product',
              ),
              controller: seriesIDController,
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
                labelText: "Product Name",
                hintText: 'Enter the product name',
              ),
              controller: productNameController,
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
                labelText: "Farmer Name",
                hintText: 'Enter the farmer name',
              ),
              controller: farmerNameController,
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
                labelText: "Harvest Place",
                hintText: 'Enter the harvest place',
              ),
              controller: harvestPlaceController,
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
                labelText: "Harvest Season",
                hintText: 'Enter the harvest season',
              ),
              controller: harvestSeasonController,
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
                labelText: "Risk Group",
                hintText: 'Enter the risk group of disease',
              ),
              controller: riskGroupController,
            ),
            SizedBox(
              height: context.dynamicHeight(0.04),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  result =
                      "'series_id': ${seriesIDController.text}, 'product_name': ${productNameController.text}, 'farmer_name': ${farmerNameController.text}, 'harvest_place':${harvestPlaceController.text}, 'harvest_season': ${harvestSeasonController.text}, 'risk_group': ${riskGroupController.text}";
                });
              },
              child: Text("Generate"),
              color: colorConstant.brightTurquoise,
            ),
          ],
        ),
      ),
    );
  }
}

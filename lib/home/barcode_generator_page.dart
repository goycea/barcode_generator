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
  final TextEditingController kgController = TextEditingController();
  final TextEditingController gasTypeController = TextEditingController();
  final TextEditingController costumerIDController = TextEditingController();
  final TextEditingController issueDateController = TextEditingController();
  final TextEditingController receiptDateController = TextEditingController();
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
                hintText: 'Enter Series ID of tube',
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
                labelText: "KG",
                hintText: 'Enter KG of tube',
              ),
              controller: kgController,
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
                labelText: "Gas Type",
                hintText: 'Enter gas type of tube',
              ),
              controller: gasTypeController,
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
                labelText: "Customer ID",
                hintText: 'Enter Customer ID',
              ),
              controller: costumerIDController,
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
                labelText: "Date of Issue",
                hintText: 'Enter Date of Issue',
              ),
              controller: issueDateController,
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
                labelText: "Date of Receipt",
                hintText: 'Enter Date of Receipt',
              ),
              controller: receiptDateController,
            ),
            SizedBox(
              height: context.dynamicHeight(0.04),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  result =
                      "'series_id': ${seriesIDController.text}, 'kg': ${kgController.text}, 'gas_type': ${gasTypeController.text}, 'customer_id':${costumerIDController.text}, 'date_of_issue': ${issueDateController.text}, 'date_of_receipt': ${receiptDateController.text}";
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

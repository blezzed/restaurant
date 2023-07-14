
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/pages/receipts/index.dart';


class ReceiptsPage extends GetView<ReceiptsController> {
  const ReceiptsPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
          title: Text("Receipts")
      ),
    );
  }
}


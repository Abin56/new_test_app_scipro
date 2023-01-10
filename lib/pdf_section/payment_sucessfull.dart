import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scipro_application/pdf_section/pdf_invoice.dart';

class PaymentSucessfullScreen extends StatelessWidget {
  String customerName;
  String email;
  int inVoiceNumber;
  String purchasingModel;
  String price;
  PaymentSucessfullScreen(
      {required this.customerName,
      required this.email,
      required this.price,
      required this.inVoiceNumber,
      required this.purchasingModel,
      super.key});

  @override
  Widget build(BuildContext context) {
    nextpage();
    return Scaffold(
      body:
          SafeArea(child: Center(child: CircularProgressIndicator.adaptive())),
    );
  }

  nextpage() async {
    await Future.delayed(Duration(seconds: 2));
    Get.to(InvoiceScreen(
      inVoiceNumber: inVoiceNumber,
        customerName: customerName,
        email: email,
        price: double.parse(price),
        purchasingModel: purchasingModel));
  }
}

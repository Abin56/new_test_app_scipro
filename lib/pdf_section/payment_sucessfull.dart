import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:scipro_application/pdf_section/pdf_invoice.dart';

class PaymentSucessfullScreen extends StatelessWidget {
  String customerName;
  String email;
  String purchasingModel;
  String price;
  PaymentSucessfullScreen(
      {required this.customerName,
      required this.email,
      required this.price,
      required this.purchasingModel,
      super.key});

  @override
  Widget build(BuildContext context) {
    nextpage();
    return Scaffold(
      body: SafeArea(
          child: Center(
        child:
            LottieBuilder.asset('assets/images/83666-payment-successfull.json'),
      )),
    );
  }

  nextpage() async {
    await Future.delayed(Duration(seconds: 2));
    Get.to(InvoiceScreen(
        customerName: customerName,
        email: email,
        price: double.parse(price),
        purchasingModel: purchasingModel));
  }
}

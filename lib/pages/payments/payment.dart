import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/PaymentController.dart';
import '../setting/settingwidget.dart';

class Payment extends StatefulWidget {
  final String email;
  final String name;
  const Payment({super.key, required this.email, required this.name});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
        init: PaymentController(context),
        builder: (controler) {
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Text("Plans & Pricing"),
              ),
              body: ListView(
                children: [
                  paymentBox("Starter", 2499, () {
                    controler.dopayment(
                        2499, "Starter", widget.email, widget.name);
                  }, "2,000"),
                  paymentBox("Essential", 4999, () {
                    controler.dopayment(
                        4999, "Essential", widget.email, widget.name);
                  }, "10,000"),
                  paymentBox("Unlimited", 10000, () {
                    controler.dopayment(
                        10000, "Unlimited", widget.email, widget.name);
                  }, "Unlimited")
                ],
              ));
        });
  }
}

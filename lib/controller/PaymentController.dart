import 'package:chatgpt/pages/home/Home.dart';
import 'package:chatgpt/widgets/Widgethelper1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  Razorpay? razorpay;
  BuildContext? context;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  PaymentController(BuildContext cotext) {
    context = cotext;
    razorpay = Razorpay();
    razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds

    Get.rawSnackbar(
        title: "Payment SuccesFull",
        messageText: Text("Your Payment is Succesfull with " +
            response.paymentId.toString()));
    Get.offAll(() => Home());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    Get.rawSnackbar(
        title: "Payment Failure",
        messageText:
            Text("Your Payment is Failed with" + response.error.toString()));
    Get.offAll(() => Home());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    Get.rawSnackbar(
        title: "Payment Succesfull ExternalWalletResponse",
        messageText: Text(
            "Your Payment is Succesfull  ExternalWalletResponse with" +
                response.walletName.toString()));
    Get.offAll(() => Home());
  }

  dopayment(int money, String plan, String email, String name) {
    String date = DateTime.now().toString();
    var options = {
      'key': 'rzp_test_eliUYQ3PMuKN56',
      'amount': money * 100, //in the smallest currency sub-unit.
      'name': name,
      'order': {
        "id": "order_Da" + date,
        "entity": "order",
        "amount": money * 100,
        "amount_paid": 0,
        "amount_due": money * 100,
        "currency": "INR",
        "receipt": "Receipt #20",
        "status": "created",
        "attempts": 0,
        "created_at": 1572502745
      },
      'description': plan,
      'timeout': 120, // in seconds
      'prefill': {'email': email}
    };
    razorpay!.open(options);
  }

  @override
  void dispose() {
    razorpay!.clear(); // Removes all listeners
    super.dispose();
  }
}

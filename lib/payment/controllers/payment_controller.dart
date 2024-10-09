import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan_ui/payment/models/bank_model.dart';
import 'package:lawan_ui/payment/models/card_model.dart';

class PaymentController extends GetxController {
  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController expDateCtrl = TextEditingController();
  TextEditingController cvvCtrl = TextEditingController();
  TextEditingController bankNameCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController postCodeCtrl = TextEditingController();

  // key for form
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //List Bank
  List<BankModel> bank = [
    BankModel(bankName: 'Maybank2u', iconBank: 'assets/icons/maybank.png'),
    BankModel(bankName: 'CIMB Clicks', iconBank: 'assets/icons/cimb.png'),
    BankModel(bankName: 'Public Bank', iconBank: 'assets/icons/public.png'),
    BankModel(bankName: 'RHB Now', iconBank: 'assets/icons/rhb.png'),
    BankModel(bankName: 'Ambank', iconBank: 'assets/icons/ambank.png'),
    BankModel(bankName: 'MyBSN', iconBank: 'assets/icons/bsn.png'),
    BankModel(
        bankName: 'Bank Rakyat', iconBank: 'assets/icons/bank_rakyat.png'),
    BankModel(bankName: 'UOB', iconBank: 'assets/icons/uob.png'),
    BankModel(bankName: 'Affin Bank', iconBank: 'assets/icons/affin.png'),
    BankModel(bankName: 'Bank Islam', iconBank: 'assets/icons/bank_islam.png'),
    BankModel(bankName: 'HSBC Online', iconBank: 'assets/icons/hsbc.png'),
    BankModel(
        bankName: 'Standard Chartered Bank', iconBank: 'assets/icons/scb.png'),
    BankModel(
        bankName: 'Kuwait Finance House', iconBank: 'assets/icons/kfh.png'),
    BankModel(bankName: 'Bank Muamalat', iconBank: 'assets/icons/muamalat.png'),
    BankModel(bankName: 'OCBC Online', iconBank: 'assets/icons/ocbc.png'),
    BankModel(
        bankName: 'Alliance Bank (Personal)',
        iconBank: 'assets/icons/alliance.png'),
    BankModel(
        bankName: 'Hong Leong Connect',
        iconBank: 'assets/icons/hong_leong.png'),
    BankModel(bankName: 'Agrobank', iconBank: 'assets/icons/agro.png'),
  ];

  var listCard = <CardModel>[].obs;
  var listBank = <BankModel>[].obs;
  var idx = 0.obs;

  void initPage() {
    listBank.addAll(bank);
    listBank.refresh();
  }

  bool _doValidate() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void addCard() {
    if (_doValidate()) {
      listCard.add(
        CardModel(
          cardNumber: cardNumberCtrl.text,
          bankName: bankNameCtrl.text,
          ownerName: nameCtrl.text,
          expDate: expDateCtrl.text,
          cvv: cvvCtrl.text,
          address: addressCtrl.text,
          postCode: postCodeCtrl.text,
        ),
      );
      log('Success');
      clearData();
      Get.back();
    }
  }

  void clearData() {
    cardNumberCtrl.clear();
    bankNameCtrl.clear();
    nameCtrl.clear();
    expDateCtrl.clear();
    cvvCtrl.clear();
    addressCtrl.clear();
    postCodeCtrl.clear();
  }
}

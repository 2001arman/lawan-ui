import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawan_ui/constants/constants_ui.dart';
import 'package:lawan_ui/payment/controllers/payment_controller.dart';
import 'package:lawan_ui/widgets/card_widget.dart';
import 'package:lawan_ui/widgets/custom_appbar.dart';
import 'package:lawan_ui/widgets/custom_button.dart';
import 'package:lawan_ui/widgets/custom_text_form_fields.dart';

class PaymentAddCardPage extends StatelessWidget {
  final PaymentController ctrl;
  const PaymentAddCardPage({super.key, required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          CustomAppBar.appbarButton(
            title: 'Add Card',
            isIcon: true,
            onTap: () {
              Navigator.pop(context);
              ctrl.clearData();
            },
          ),
          const CardWidget(
            icon: "assets/images/mastercard.png",
            expDate: "09/23",
            cardNumber: '1234567812345678',
            cardOwner: 'Malinna',
            cardType: 'Debit Card',
          ),
          Expanded(child: _buildForm()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              height: 48,
              child: CustomButton(
                title: 'Add Card',
                gradientColor: mainGradient,
                isBlack: true,
                onTap: () {
                  ctrl.addCard();
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: SingleChildScrollView(
        controller: ScrollController(),
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: ctrl.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Card Number',
                controller: ctrl.cardNumberCtrl,
                title: 'Card Number',
                textInputType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(16),
                ],
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'please fill out this field.';
                  } else if (v.length < 16) {
                    return 'card number must be at least 16 digits.';
                  } else {
                    return null;
                  }
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      hintText: 'MM/YY',
                      controller: ctrl.expDateCtrl,
                      title: 'Expired Date',
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'please fill out this field.';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextFormField(
                      hintText: 'CVV',
                      controller: ctrl.cvvCtrl,
                      title: 'CVV',
                      textInputType: TextInputType.number,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'please fill out this field.';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
              CustomTextFormField(
                hintText: 'Bank Name',
                controller: ctrl.bankNameCtrl,
                title: 'Bank Name',
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'please fill out this field.';
                  } else {
                    return null;
                  }
                },
              ),
              CustomTextFormField(
                hintText: 'Name',
                controller: ctrl.nameCtrl,
                title: 'Name on Card',
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'please fill out this field.';
                  } else {
                    return null;
                  }
                },
              ),
              CustomTextFormField(
                hintText: 'Address',
                controller: ctrl.addressCtrl,
                title: 'Billing Address',
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'please fill out this field.';
                  } else {
                    return null;
                  }
                },
              ),
              CustomTextFormField(
                hintText: 'Postal Code',
                controller: ctrl.postCodeCtrl,
                textInputType: TextInputType.number,
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'please fill out this field.';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

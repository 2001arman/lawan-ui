import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan_ui/constants/constants_ui.dart';
import 'package:lawan_ui/payment/controllers/payment_controller.dart';
import 'package:lawan_ui/payment/pages/payment_add_card_page.dart';
import 'package:lawan_ui/widgets/card_widget.dart';
import 'package:lawan_ui/widgets/custom_appbar.dart';
import 'package:lawan_ui/widgets/custom_button.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final ctrl = Get.put(PaymentController());
  int _selectedBankIndex = -1;
  int _selectedBankIndex2 = -1;
  bool _isSelected = false;
  bool _isSelected2 = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ctrl.initPage();
    });
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<PaymentController>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              CustomAppBar.appbarButton(title: 'Payment Methods'),
              _buildListCard(),
              Expanded(
                child: _buildListBank(),
              ),
            ],
          ),
          if (_isSelected || _isSelected2)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                height: 48,
                child: CustomButton(
                  title: 'Confirm',
                  gradientColor: mainGradient,
                  isBlack: true,
                  onTap: () {},
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildListCard() {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(left: 16, right: 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentAddCardPage(ctrl: ctrl),
                ),
              );
            },
            child: Container(
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: mainGradient,
                border: Border.all(
                  width: 1,
                  color: Colors.transparent,
                ),
              ),
              child: Icon(
                Icons.add,
                color: kWhiteColor,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Obx(() {
              if (ctrl.listCard.isEmpty) {
                return Container(
                  height: 140,
                  // width: 250,
                  margin: const EdgeInsets.only(left: 0, right: 16),
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No Cards Yet',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                      Text(
                        'Add a card for faster checkout.',
                        style: darkGreyTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: reguler,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: ctrl.listCard.length,
                itemBuilder: (context, index) {
                  final item = ctrl.listCard[index];
                  _isSelected2 = _selectedBankIndex2 == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_selectedBankIndex2 == index) {
                          _selectedBankIndex2 = -1;
                          _isSelected2 = false;
                          // log(_isSelected2.toString());
                        } else {
                          _selectedBankIndex2 = index;
                          _selectedBankIndex = -1;
                          _isSelected2 = true;
                          // log(_isSelected2.toString());
                        }
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 10),
                          child: CardWidget(
                            icon: "assets/images/mastercard.png",
                            expDate: item.expDate,
                            cardNumber: item.cardNumber,
                            cardOwner: item.ownerName,
                            cardType: 'Debit Card',
                          ),
                        ),
                        if (_isSelected2)
                          SizedBox(
                            width: 250,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Icon(
                                Icons.check_circle,
                                color: kBlackColor,
                                size: 24.0,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildListBank() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Online Banking",
              style: darkGreyTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Obx(() {
              return GridView.builder(
                padding: const EdgeInsets.only(bottom: 80),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 16,
                ),
                itemCount: ctrl.listBank.length,
                itemBuilder: (context, index) {
                  final item = ctrl.listBank[index];
                  _isSelected = _selectedBankIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_selectedBankIndex == index) {
                          _selectedBankIndex = -1;
                          _isSelected = false;
                          // log(_isSelected.toString());
                        } else {
                          _selectedBankIndex2 = -1;
                          _selectedBankIndex = index;
                          _isSelected = true;
                          // log(_isSelected.toString());
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: _isSelected ? Colors.black : kWhiteColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            item.iconBank,
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Text(
                              item.bankName,
                              style: _isSelected
                                  ? whiteTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: medium,
                                    )
                                  : blackTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: medium,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}

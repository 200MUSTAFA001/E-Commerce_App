import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'expandable_payment_item.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({super.key, required this.paymentMethod});

  final void Function(String) paymentMethod;

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  int? selectedPayment;

  Widget _paymentRadioTile({
    required int value,
    required IconData icon,
    required String title,
    Color? iconColor,
    required String paymentMethod,
  }) {
    return ListTile(
      onTap: () {
        setState(() {
          selectedPayment = value;
          widget.paymentMethod(paymentMethod);
        });
      },
      leading: Icon(icon, color: iconColor),
      title: Text(title),
      trailing: Radio(
        value: value,
        activeColor: Colors.deepOrangeAccent,
        groupValue: selectedPayment,
        onChanged: (s) {
          setState(() {
            selectedPayment = s;
            widget.paymentMethod(paymentMethod);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ExpandablePaymentItem(
            paymentItemIcon: FontAwesomeIcons.creditCard,
            paymentItemIconColor: Colors.blue,
            paymentItemBackgroundColor: Colors.blue.shade50,
            paymentItemName: "Credit/Debit Card",
            paymentItemOptions: Column(
              children: [
                _paymentRadioTile(
                    value: 0,
                    icon: Icons.credit_card,
                    title: "Visa",
                    iconColor: Colors.blue,
                    paymentMethod: "Credit/Debit Card"),
                _paymentRadioTile(
                    value: 1,
                    icon: Icons.credit_card,
                    title: "MasterCard",
                    iconColor: Colors.blue,
                    paymentMethod: "Credit/Debit Card"),
                _paymentRadioTile(
                    value: 2,
                    icon: Icons.credit_card,
                    title: "RuPay",
                    iconColor: Colors.blue,
                    paymentMethod: "Credit/Debit Card"),
              ],
            ),
          ),
          ExpandablePaymentItem(
            paymentItemIcon: Icons.account_balance,
            paymentItemIconColor: Colors.green,
            paymentItemBackgroundColor: Colors.green.shade50,
            paymentItemName: "NetBanking",
            paymentItemOptions: Column(
              children: [
                _paymentRadioTile(
                    value: 3,
                    icon: Icons.account_balance,
                    title: "HDFC Bank",
                    iconColor: Colors.green,
                    paymentMethod: "NetBanking"),
                _paymentRadioTile(
                    value: 4,
                    icon: Icons.account_balance,
                    title: "CIP Bank",
                    iconColor: Colors.green,
                    paymentMethod: "NetBanking"),
                _paymentRadioTile(
                    value: 5,
                    icon: Icons.account_balance,
                    title: "SBI Bank",
                    iconColor: Colors.green,
                    paymentMethod: "NetBanking"),
              ],
            ),
          ),
          ExpandablePaymentItem(
            paymentItemIcon: Icons.wallet,
            paymentItemIconColor: Colors.orange,
            paymentItemBackgroundColor: Colors.orange.shade50,
            paymentItemName: "Wallet",
            paymentItemOptions: Column(
              children: [
                _paymentRadioTile(
                    value: 6,
                    icon: Icons.wallet,
                    title: "Paytm",
                    iconColor: Colors.orange,
                    paymentMethod: "Wallet"),
                _paymentRadioTile(
                    value: 7,
                    icon: Icons.wallet,
                    title: "PhonePe",
                    iconColor: Colors.orange,
                    paymentMethod: "Wallet"),
                _paymentRadioTile(
                    value: 8,
                    icon: Icons.wallet,
                    title: "Google Pay",
                    iconColor: Colors.orange,
                    paymentMethod: "Wallet"),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              setState(() {
                selectedPayment = 9;
                widget.paymentMethod("Cash On Delivery");
              });
            },
            trailing: Radio(
              value: 9,
              activeColor: Colors.deepOrangeAccent,
              groupValue: selectedPayment,
              onChanged: (s) {
                setState(() {
                  selectedPayment = s;
                  widget.paymentMethod("Cash On Delivery");
                });
              },
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.red.shade50,
              child: const Icon(FontAwesomeIcons.moneyBill, color: Colors.red),
            ),
            title: const Text(
              "Cash On Delivery",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ).paddingAll(12),
        ],
      ),
    );
  }
}

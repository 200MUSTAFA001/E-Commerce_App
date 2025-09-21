import 'package:e_commerce_app/extensions.dart';
import 'package:expand/expand.dart';
import 'package:flutter/material.dart';

class ExpandablePaymentItem extends StatelessWidget {
  ExpandablePaymentItem({
    super.key,
    required this.paymentItemIcon,
    required this.paymentItemIconColor,
    required this.paymentItemBackgroundColor,
    required this.paymentItemName,
    required this.paymentItemOptions,
  });

  final IconData paymentItemIcon;
  final Color paymentItemIconColor;
  final Color paymentItemBackgroundColor;
  final String paymentItemName;
  final Widget paymentItemOptions;

  final ExpandableController controller = ExpandableController();

  @override
  Widget build(BuildContext context) {
    return ExpandableTile(
      controller: controller,
      elevationExpanded: 1,
      shapeExpanded:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      trailing: const Icon(Icons.keyboard_arrow_down_outlined, size: 36),
      leading: CircleAvatar(
        backgroundColor: paymentItemBackgroundColor,
        child: Icon(paymentItemIcon, color: paymentItemIconColor),
      ),
      title: Text(
        paymentItemName,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
      detailsBuilder: (context) => paymentItemOptions,
    ).paddingAll(12);
  }
}

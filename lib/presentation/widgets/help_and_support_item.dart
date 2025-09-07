import 'package:flutter/material.dart';

class HelpAndSupportItem extends StatelessWidget {
  const HelpAndSupportItem({
    super.key,
    required this.serviceName,
    required this.serviceValue,
    required this.serviceIcon,
    required this.serviceOnTap,
  });
  final String serviceName;
  final String serviceValue;
  final Widget serviceIcon;
  final void Function() serviceOnTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        onTap: serviceOnTap,
        title: Text(serviceName,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(serviceValue),
        trailing: serviceIcon,
      ),
    );
  }
}
// 👋
// U+1F44B

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:api_app/extensions.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SettingsPage"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("SettingsPage"),
            SizedBox(
              height: context.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}

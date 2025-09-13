import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/help_support_custom_widgets/help_and_support_item.dart';

class HelpAndSupportPage extends StatelessWidget {
  const HelpAndSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Help & Support"),
            backgroundColor: Colors.white,
          ),
          SliverToBoxAdapter(
            child: Image.asset("assets/help_support/helpAndSupport.webp"),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text(
                  "Hi👋 How can i help ?",
                  style: GoogleFonts.firaSans(
                      fontSize: 30, fontWeight: FontWeight.w500),
                ).paddingOnly(top: 12, bottom: 6),
                const Text(
                  "Got any question about our service or your order? Just Our e-commerce superheroes are ready to assist and support you.",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                  textAlign: TextAlign.center,
                ).paddingOnly(left: 40, right: 40)
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                HelpAndSupportItem(
                  serviceName: "Call Us",
                  serviceValue: "+20 - 123 456 7890",
                  serviceIcon: const Icon(
                    CupertinoIcons.phone_fill_arrow_up_right,
                    color: Colors.redAccent,
                  ),
                  serviceOnTap: () {
                    final url = Uri.parse("tel:+20 1234567890");
                    launchUrl(url);
                  },
                ),
                HelpAndSupportItem(
                  serviceName: "Mail Us",
                  serviceValue: "support@e-commerce.com",
                  serviceIcon: const Icon(
                    CupertinoIcons.envelope_fill,
                    color: Colors.lightBlue,
                  ),
                  serviceOnTap: () {
                    const mailBody = '''
Hello Support Team,

I am experiencing an issue related to
[briefly describe the issue].

📌 Issue details:
- Device: 
- App version: 
- OS version: 
- Time of occurrence: 
- Steps to reproduce:

📷 Attachments (optional):

Thank you for your support.
''';
                    final url =
                        Uri.parse("mailto:e-commerce@gmail.com?body=$mailBody");
                    launchUrl(url);
                  },
                ),
                HelpAndSupportItem(
                  serviceName: "Live Chat",
                  serviceValue: "Start Live Chat with us",
                  serviceIcon: const Icon(
                    CupertinoIcons.chat_bubble_2_fill,
                    color: CupertinoColors.activeGreen,
                  ),
                  serviceOnTap: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:e_commerce_app/app_router.dart';
import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/profile_page_custom_widgets/profile_page_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          const SliverAppBar(),
          SliverToBoxAdapter(
            child: Column(
              spacing: 8,
              children: [
                SizedBox.square(
                  dimension: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Hero(
                      tag: "userImage",
                      child: Image.asset(
                        "assets/mock_pics/user_pic.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const Text(
                  "Emy Adams",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
                const Text(
                  "emy_adams55@gmail.com",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ProfilePageItem(
                    itemIcon: CupertinoIcons.person_solid,
                    itemName: "Profile",
                    onTap: () {}),
                ProfilePageItem(
                    itemIcon: Icons.settings,
                    itemName: "Settings",
                    onTap: () {
                      context.push(AppRouter.settingsPage);
                    }),
                ProfilePageItem(
                    itemIcon: CupertinoIcons.envelope_fill,
                    itemName: "Contact",
                    onTap: () {}),
                ProfilePageItem(
                    itemIcon: Icons.share, itemName: "Share App", onTap: () {}),
                ProfilePageItem(
                    itemIcon: Icons.help,
                    itemName: "Help & Support",
                    onTap: () {
                      context.push(AppRouter.helpAndSupportPage);
                    }),
              ],
            ).paddingOnly(top: 14, right: 6, left: 6),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sign Out",
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  )).paddingOnly(bottom: 20),
            ),
          ),
        ],
      ),
    );
  }
}

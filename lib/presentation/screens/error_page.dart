import 'package:e_commerce_app/app_router.dart';
import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.errorDetails});

  final FlutterErrorDetails errorDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: context.height * 0.3,
              child: Transform.scale(
                scale: 2,
                child: Lottie.asset("assets/error.json", repeat: false),
              ),
            ).onlyPadding(bottom: 80),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Text(
                  "Error Occurred!",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
                ).onlyPadding(left: 20),
                const Text("Something went wrong",
                        style: TextStyle(fontSize: 20, color: Colors.black54))
                    .onlyPadding(left: 20, bottom: 50),
                ElevatedButton(
                  onPressed: () {
                    context.go(AppRouter.homePage);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fixedSize:
                          Size(context.width * 0.8, context.height * 0.07)),
                  child: const Text(
                    "Back to Homepage",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ).onlyPadding(left: 20, bottom: 10),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actions: [
                          FilledButton(
                              onPressed: () {
                                context.pop();
                              },
                              child: const Text("close"))
                        ],
                        title: const Text("Error details"),
                        content: SingleChildScrollView(
                          child: SelectableText(errorDetails.toString()),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Error details",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ).onlyPadding(left: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/*

[
          SizedBox(
            height: context.height * 0.3,
            width: context.width * 1,
            child: Transform.scale(
              scale: 2,
              child: Lottie.asset("assets/error.json", repeat: false),
            ),
          ).onlyPadding(right: 20),
          SizedBox(height: context.height * 0.12),
          Text(
            "Error Occured!",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
          ),
          Text("Something went wrong",
              style: TextStyle(fontSize: 20, color: Colors.black54)),
          ElevatedButton(
            onPressed: () {},
            child: Text("Back to Homepage"),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(),
                fixedSize: Size(context.width * 0.7, context.height * 0.08)),
          )
        ]

*/

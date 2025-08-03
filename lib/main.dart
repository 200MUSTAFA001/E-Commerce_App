import 'dart:async';

import 'package:api_app/logic/cubit/cart_cubit.dart';
import 'package:api_app/logic/cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app_router.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getApplicationDocumentsDirectory()).path,
    ),
  );
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => FavoritesCubit()),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}

void showSnackBar(String message, BuildContext context) {
  // int counter = 5;
  // Timer.periodic(const Duration(seconds: 5), (timer) {
  //   print(timer.tick);
  //   counter--;
  // });
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
      elevation: 10,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: const Row(
        children: [
          Icon(Icons.check_circle_outline, color: Colors.green, size: 28),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "Done",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}

// void showSnackBar(String message, BuildContext context){
// scaffoldMessengerKey.currentState?.showSnackBar(
//   SnackBar(
//     content: Text(message),
//     duration: const Duration(seconds: 3),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//     behavior: SnackBarBehavior.floating,
//     action: SnackBarAction(
//         label: "label",
//         onPressed: () {
//           Navigator.pop(context);
//         }),
//   ),
// );
// }

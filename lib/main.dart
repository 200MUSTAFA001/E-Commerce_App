// Dart imports:
import 'dart:async';

// Project imports:
import 'package:e_commerce_app/logic/cubit/hydrated_cubits/cart_cubit.dart';
import 'package:e_commerce_app/logic/cubit/hydrated_cubits/wishlist_cubit.dart';
import 'package:e_commerce_app/presentation/screens/others_pages/error_page.dart';
// Flutter imports:
import 'package:e_commerce_app/presentation/widgets/custom_widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app_router.dart';

Future<void> main() async {
  // FlutterError.onError = (errorDetails) {
  //   FlutterError.dumpErrorToConsole(errorDetails);
  // }; Todo : errors not related to the build or ui

  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getApplicationDocumentsDirectory()).path,
    ),
  );
  ErrorWidget.builder =
      (errorDetails) => ErrorScreen(errorDetails: errorDetails);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final routerConfig = AppRouter().router;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => WishlistCubit()),
      ],
      child: MaterialApp.router(
        scaffoldMessengerKey: scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        routerConfig: routerConfig,
      ),
    );
  }
}

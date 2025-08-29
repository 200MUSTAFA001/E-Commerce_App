// Dart imports:
import 'dart:async';

// Project imports:
import 'package:api_app/logic/cubit/cart_cubit.dart';
import 'package:api_app/logic/cubit/wishlist_cubit.dart';
// Flutter imports:
import 'package:api_app/presentation/widgets/custom_widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getApplicationDocumentsDirectory()).path,
    ),
  );
  await dotenv.load(fileName: ".env");
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

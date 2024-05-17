import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/bloc_observer.dart';
import 'package:trim_spot_user_side/data/firebase_options.dart';
import 'package:trim_spot_user_side/screens/splash_screen.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/providers/main_provider_list.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return (MultiBlocProvider(
      providers: mainProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
            textSelectionTheme:
                const TextSelectionThemeData(selectionHandleColor: cyanColor),
            bottomSheetTheme:
                const BottomSheetThemeData(backgroundColor: introductionColor)),
        home: const SplashScreen(),
      ),
    ));
  }
}

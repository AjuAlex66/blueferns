import 'package:blueferns_taskaju/domain/initializer.dart';
import 'package:blueferns_taskaju/presentation/blocs/filterbloc.dart';
import 'package:blueferns_taskaju/presentation/providers/changerprovider.dart';
import 'package:blueferns_taskaju/presentation/screens/homepage.dart';
import 'package:blueferns_taskaju/presentation/style/apptheme.dart';
import 'package:blueferns_taskaju/presentation/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const BlueFernsApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

class BlueFernsApp extends StatelessWidget {
  const BlueFernsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FilterBloc()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ChangerProvider>(
              create: (context) => ChangerProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.buildAppTheme(),
          navigatorKey: NavigationService.navigatorKey,
          home: Builder(builder: (context) {
            Initializer.changerProvider = context.read<ChangerProvider>();
            return const HomePage();
          }),
        ),
      ),
    );
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

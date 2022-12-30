import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:list/generated/l10n.dart';
import 'package:list/resources/themes.dart';
import 'package:list/routes/routes.dart';
import 'package:list/screens/list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(
    MyApp(
      savedThemeMode: savedThemeMode,
    ),
  );
}
//   runApp(const MyApp());
// }

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    this.savedThemeMode,
  });
  final AdaptiveThemeMode? savedThemeMode;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    noneView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        builder: (ThemeData light, ThemeData dark) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: light,
            darkTheme: dark,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            initialRoute: ListPage.routeName,
            onGenerateRoute: AppRouter.generateRoute,
            routes: {
              ListPage.routeName: (_) => const ListPage(),
            },
          );
        },
        initial: widget.savedThemeMode != null
            ? AdaptiveThemeMode.light
            : AdaptiveThemeMode.dark,
        light: AppThemes.light(),
        dark: AppThemes.dark(),
    );
  }
}

void noneView() {
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
}

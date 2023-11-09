import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heal_tec/src/core/routes/router.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'app',
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const <Locale>[
          Locale('en', ''), // English, no country code
        ],

        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context)!.appTitle,

        theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.light,

        // Define a function to handle named routes in order to support
        // Flutter web url navigation and deep linking.
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/demo_localization.dart';
import 'package:localization/login_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  static void setLocale(BuildContext context,Locale locale){
    _MyAppState state=context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  void setLocale(Locale locale)
  {
    setState(() {
      _locale=locale;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      locale: _locale,
      supportedLocales: [
        Locale('en','US'),
        Locale('hi','IN'),
      ],
     localizationsDelegates: [
       DemoLocalization.delegate,
       GlobalMaterialLocalizations.delegate,
       GlobalWidgetsLocalizations.delegate,
       GlobalCupertinoLocalizations.delegate,
     ],
      localeResolutionCallback: (deviceLocale,supportedLocales){
        for(var locale in supportedLocales)
          {
            if(locale.languageCode==deviceLocale.languageCode && locale.countryCode==deviceLocale.countryCode)
            {
              return deviceLocale;
            }
          }
        return supportedLocales.first;
      },
      home:LoginPage(),
    );
  }
}






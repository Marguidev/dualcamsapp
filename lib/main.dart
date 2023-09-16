import 'package:dualcamsapp/providers/color_scheme.dart';
import 'package:dualcamsapp/screens/tabs.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var couleur1 = Colors.white;
    var couleur2 = Color.fromARGB(255, 121, 224, 138);
    var couleur3 = Color.fromARGB(255, 65, 100, 98);

    var colorScheme = ColorScheme.light(
      primary: couleur1,
      secondary: couleur2,
      tertiary: couleur3,
    );

    return ColorSchemeProvider(
      colorScheme: colorScheme,
      child: MaterialApp(
        home: TabsScreen(),
      ),
    );
  }
}

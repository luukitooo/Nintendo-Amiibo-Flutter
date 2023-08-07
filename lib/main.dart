import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/amiibo_list_screen.dart';
import 'presentation/amiibo_list_viewmodel.dart';

void main() { runApp(const AmiiboApp()); }

class AmiiboApp extends StatelessWidget {
  const AmiiboApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)  => AmiiboListViewModel(),
      child: MaterialApp(
        title: 'AmiiboApp',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AmiiboListScreen(),
      ),
    );
  }
}

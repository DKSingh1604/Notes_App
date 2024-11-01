import 'package:flutter/material.dart';
import 'package:isar_crud/models/note_database.dart';
import 'package:isar_crud/pages/notes_page.dart';
import 'package:isar_crud/theme/theme_provider.dart';

import 'package:provider/provider.dart';

void main() async {
  //initialize the database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(
    MultiProvider(
      providers: [
        //note provider
        ChangeNotifierProvider(create: (context) => NoteDatabase()),

        //theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const NotesPage(),
    );
  }
}

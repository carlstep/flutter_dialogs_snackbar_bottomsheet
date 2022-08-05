import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
// SnackBar is declared as a variable 'snackBar' inside of the class, but outside of the build.
  final snackBar = SnackBar(
    content: Text(
      'Successfully Saved!',
      style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 20),
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    action: SnackBarAction(
      onPressed: () {},
      label: 'Undo',
      textColor: Colors.amber,
    ),
    backgroundColor: Colors.blueGrey,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

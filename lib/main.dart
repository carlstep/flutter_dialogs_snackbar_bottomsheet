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

  String delete = 'No choice made.';
  String location = 'None Selected Yet!';

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
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.amber),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      alignment: Alignment.topCenter,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              delete = 'You selected no!';
                            });
                            // using Navigator.pop, when action is pressed, the dialog screen closes
                            Navigator.pop(context);
                          },
                          child: Text('No!'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              delete = 'You selected yes!';
                            });
                            Navigator.pop(context);
                          },
                          child: Text('Yes'),
                        ),
                      ],
                      title: Text('Delete entry 12345'),
                      content:
                          Text('Are you sure you want to delete this entry?'),
                    );
                  },
                );
              },
              child: Text('Delete'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(delete),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () async {
                // How do Futures work
                final String loc = await showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      alignment: Alignment.bottomCenter,
                      title: Text('Choose Your Location...'),
                      children: [
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, 'South Africa');
                          },
                          child: Text('South Africa'),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, 'China');
                          },
                          child: Text('China'),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, 'Brazil');
                          },
                          child: Text('Brazil'),
                        ),
                      ],
                    );
                  },
                );
                setState(() {
                  location = loc;
                });
              },
              child: Text('Choose Location'),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Your location is: $location'),
          ],
        ),
      ),
    );
  }
}

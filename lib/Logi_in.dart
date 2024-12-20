import 'package:flutter/material.dart';

class LogiIn extends StatefulWidget {
  const LogiIn({super.key});

  @override
  State<LogiIn> createState() => _LogiInState();
}

class _LogiInState extends State<LogiIn> {
  bool isDark = false; // Tracks if dark mode is enabled

  void changeColor() {
    setState(() {
      isDark = !isDark; // Toggles the theme
    });
  }

  final InputDecoration textFieldDecoration = InputDecoration(
    border: OutlineInputBorder(),
    hintText: 'Enter Here',
  );

  // Show the dialog when Log In is pressed
  void showMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Successful'),
          content: Text('You have logged in successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(), // Switch theme
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'SATHY',
            style: TextStyle(
              fontSize: 24, // Custom font size
              fontWeight: FontWeight.bold, // Custom font weight
            ),
          ),
          centerTitle: true,
          backgroundColor: isDark ? Colors.grey[850] : Colors.blue[300],
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.start, // Aligns content to the top
                children: [
                  // Add the Image widget above the text fields
                  Image.asset(
                    'assets/UI.png', // Replace with your image path
                    height: 300, // Adjust the size of the image
                    width: 300, // Adjust the size of the image
                    fit: BoxFit.contain, // Ensure image fits within the box
                  ),
                  SizedBox(
                    height: 20,
                  ), // Reduces space between the image and the text fields

                  // First text field
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('First Name'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    scrollPadding: EdgeInsets.all(4),
                    decoration: textFieldDecoration,
                  ),
                  SizedBox(height: 20), // Adds spacing between fields

                  // Second text field
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Last Name'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: textFieldDecoration,
                  ),
                  SizedBox(height: 20), // Adds spacing between fields

                  // Third text field
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Paasword'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: textFieldDecoration,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: showMessage, // Show the dialog when pressed
                    child: Text('Log In'),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: changeColor,
          child: Icon(Icons.color_lens),
          backgroundColor: isDark ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}

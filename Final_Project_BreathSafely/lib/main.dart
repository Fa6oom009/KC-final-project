import 'package:flutter/material.dart';
import 'package:flutter_application_13/pages/mainPage.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Center(
                  child: Container(
                child: Text(
                  "Breath Safely - تنفس بأمان",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
              backgroundColor: Color.fromARGB(255, 3, 92, 22),
              leading: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => PopupClassDialog());
                  },
                  icon: Icon(Icons.question_mark)),
            ),
            body: Center(
              child: Stack(children: [
                Image.asset(
                  "../images/BreathSafly.jpg",
                  fit: BoxFit
                      .cover, // This ensures the image covers the entire screen
                  width:
                      double.infinity, // Make the width as wide as the screen
                  height: double.infinity,
                ),
                firstpage(),
              ]),
            )));
  }
}

class firstpage extends StatefulWidget {
  const firstpage({
    super.key,
  });

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: ElevatedButton(
              child: Text("Start"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color.fromARGB(255, 1, 49, 3))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class PopupClassDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("هدف المشروع"),
      content: popup_class(),
      actions: [
        TextButton(
          child: Text("حياكم",
              style: TextStyle(color: Color.fromARGB(255, 45, 158, 54))),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}

class popup_class extends StatelessWidget {
  popup_class({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 45, 158, 54),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black, width: 4),
          boxShadow: [
            new BoxShadow(
              color: Color.fromARGB(255, 45, 158, 54),
              offset: new Offset(6.0, 6.0),
            ),
          ]),
      width: 100,
      height: 200,
      child: Center(
          child: Text(
        "يهدف تطبيق تنفس بأمان إلى حماية البيئة والحفاظ على جودة الهواء وذلك من خلال رفع مستوى الوعي البيئي للمجتمع الكويتي وتوفير المنتجات صديقة للبيئة",
      )),
    );
  }
}

// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/last.dart'; // Import ThankYouPage
import 'package:flutter_application_1/quiz_page.dart';
import 'package:flutter_application_1/contact_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // Set rute awal
      routes: {
        '/': (context) => ContactPage(), // Rute untuk ContactPage
        '/quiz': (context) => QuizPage(), // Rute untuk QuizPage
        '/thankyou': (context) =>
            ThankYouPage(score: 0), // Rute untuk ThankYouPage
      },
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontak'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  child: ContactCard(
                    Name: 'Ageng Kurniawan',
                    PhoneNumber: '082112220904',
                    Email: 'agengkurniawannn@gmail.com',
                    Jabatan: 'ADMIN',
                    NIM: '22091397077',
                    Alamat: 'Ketintang Madya',
                    imageUrl: 'images/Agee.jpeg',
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 200,
                  child: ContactCard(
                    Name: 'Danar Adrian Ridho Nugroho',
                    PhoneNumber: '082335396537',
                    Email: 'Adrianridho.id@gmail.com',
                    Jabatan: 'OPERATOR',
                    NIM: '22091397087',
                    Alamat: 'Jetis Kulon',
                    imageUrl: 'images/Danar.jpeg',
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 200,
                  child: ContactCard(
                    Name: 'Vitto Farin Kriswandi',
                    PhoneNumber: '082136467200',
                    Email: 'vittofarin19@gmail.com',
                    Jabatan: 'SYSTEM DESIGNER',
                    NIM: '22091397096',
                    Alamat: 'Banyu Urip',
                    imageUrl: 'images/Vitto.jpeg',
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/quiz');
                  },
                  child: Text('Selanjutnya'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

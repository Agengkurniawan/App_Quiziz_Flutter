// contact_card.dart
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String Name;
  final String PhoneNumber;
  final String Email;
  final String Jabatan;
  final String NIM;
  final String Alamat;
  final String imageUrl;

  ContactCard({
    required this.Name,
    required this.PhoneNumber,
    required this.Email,
    required this.Jabatan,
    required this.NIM,
    required this.Alamat,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 350,
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Detail Profil'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(imageUrl),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('Nama: $Name'),
                    Text('Nomor Telepon: $PhoneNumber'),
                    Text('Email: $Email'),
                    Text('NIM: $NIM'),
                    Text('Alamat: $Alamat'),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Tutup'),
                  ),
                ],
              );
            },
          );
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(imageUrl),
                ),
                SizedBox(height: 10),
                Text(
                  Name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  Jabatan,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

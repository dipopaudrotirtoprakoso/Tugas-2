import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // Fungsi untuk membuka email
  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'resto@example.com', // Ganti dengan alamat email yang ditentukan
      queryParameters: {'subject': 'Tanya Seputar Resto'},
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Tidak dapat membuka email';
    }
  }

  // Fungsi untuk membuka telepon
  void _launchPhone() async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: '081234567890', // Ganti dengan nomor telepon yang ditentukan
    );
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Tidak dapat membuka aplikasi telepon';
    }
  }

  // Fungsi untuk membuka peta ke koordinat UDINUS
  void _launchMap() async {
    final Uri mapUri = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=-6.9822,110.4091");
    if (await canLaunchUrl(mapUri)) {
      await launchUrl(mapUri);
    } else {
      throw 'Tidak dapat membuka aplikasi peta';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Rumah Makan Rasa Tak Sedap",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(child: Image.asset('assets/images/Resto.jpg')),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.email, color: Colors.black),
                        onPressed: _launchEmail,
                      ),
                      IconButton(
                        icon: Icon(Icons.phone, color: Colors.black),
                        onPressed: _launchPhone,
                      ),
                      IconButton(
                        icon: Icon(Icons.map, color: Colors.black),
                        onPressed: _launchMap,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Deskripsi:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Menu di Rumah Makan Sedap Rasa menawarkan berbagai hidangan khas Indonesia yang lezat seperti Soto, Bakso, dan Nasi Goreng. Bahan-bahan segar dan rempah-rempah pilihan menjadikan cita rasa masakan kami autentik dan memuaskan.",
                  ),
                  SizedBox(height: 20),
                  Text(
                    "List Menu:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Bungkus ListView dalam Container yang tetap berada di dalam SingleChildScrollView
                  Container(
                    height:
                        200, // Tentukan tinggi agar semua item list terlihat
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: <Widget>[
                        Container(
                          height: 50,
                          color: Colors.amber,
                          margin: EdgeInsets.only(bottom: 10),
                          child: const Center(
                            child: Text(
                              'Soto',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          color: Colors.amber,
                          margin: EdgeInsets.only(bottom: 10),
                          child: const Center(
                            child: Text(
                              'Bakso',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          color: Colors.amber,
                          margin: EdgeInsets.only(bottom: 10),
                          child: const Center(
                            child: Text(
                              'Nasi Goreng',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Alamat:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("Jalan Imam Bonjol, Semarang, Jawa Tengah"),
                  SizedBox(height: 20),
                  Text(
                    "Jam Buka:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("Setiap hari jam 08:00 - 22:00 WIB")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

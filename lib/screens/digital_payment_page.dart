import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:user_homepage/main.dart';
import 'package:user_homepage/screens/widget/popupmenu.dart';

class DigitalPaymentPage extends StatelessWidget {
  final double amount;

  const DigitalPaymentPage({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF018ABE),
        appBar: AppBar(
          leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => UserHomepage()),
            );
          },
        ),
          centerTitle: true,
          title: Text(
              "DIGITAL PAYMENT",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              )
          ),
          actions: [
              CustomPopupMenu(),
        ],          
        backgroundColor: Color(0xFF018ABE),
        ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Tambahkan padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    const Text('SCAN QR CODE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22)),
                    const SizedBox(height: 10),
                    QrImageView(
                      data: 'Pembayaran Rp ${amount.toStringAsFixed(3)}',
                      version: QrVersions.auto,
                      size: 250.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Scan untuk pembayaran',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika untuk tombol "Lanjut" di sini
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Sesuaikan warna tombol
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Lanjut',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
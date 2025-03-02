import 'package:flutter/material.dart';
import 'package:user_homepage/main.dart';
import 'package:user_homepage/screens/widget/popupmenu.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Import package qr_flutter
// import halaman digital
import 'package:user_homepage/screens/digital_payment_page.dart';

class PaymentPage extends StatefulWidget {
  final String imagePath;
  final String title;
  final String price;
  final int quantity;

  const PaymentPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.quantity,
  });

  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  String paymentMethod = 'Cash';
  TextEditingController customerNameController = TextEditingController();
  TextEditingController tableNumberController = TextEditingController();
  TextEditingController customerNominalController = TextEditingController();
  double totalAmount = 40000.0;
  double changeAmount = 0.0;

  void _handlePaymentConfirmation(double totalPrice) {
    if (paymentMethod == 'Digital') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DigitalPaymentPage(amount: totalPrice),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pembayaran berhasil!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice =
        double.parse(widget.price.replaceAll('Rp ', '')) * widget.quantity;

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
              "METODE PEMBAYARAN",
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Informasi Pelanggan',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: customerNameController,
                        decoration: InputDecoration(
                          labelText: 'Nama Pelanggan',
                          hintText: 'Masukkan nama pelanggan',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: tableNumberController,
                        decoration: InputDecoration(
                          labelText: 'Nomor Meja',
                          hintText: 'Masukkan nomor meja',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Detail Pesanan',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(widget.imagePath, width: 60, height: 60, fit: BoxFit.cover),
                          ),
                          title: Text(
                            widget.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Harga: ${widget.price}',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                      ),
                    ],                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Metode Pembayaran',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: RadioListTile(
                                title: const Text('Cash'),
                                value: 'Cash',
                                groupValue: paymentMethod,
                                onChanged: (value) {
                                  setState(() {
                                    paymentMethod = value.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: RadioListTile(
                                title: const Text('Digital'),
                                value: 'Digital',
                                groupValue: paymentMethod,
                                onChanged: (value) {
                                  setState(() {
                                    paymentMethod = value.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Detail Pembayaran',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Total: Rp ${totalPrice.toStringAsFixed(3)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: customerNominalController,
                        decoration: InputDecoration(
                          labelText: 'Nominal Pembayaran',
                          hintText: 'Masukkan nominal pembayaran',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (value) {
                          setState(() {
                            double nominal = double.tryParse(value) ?? 0.0;
                            changeAmount = nominal - totalPrice;
                          });
                        },
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Kembalian: Rp ${changeAmount.toStringAsFixed(3)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'BATALKAN',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                 Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _handlePaymentConfirmation(totalPrice);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'KONFIRMASI',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],          ),
        ),
      ),
    );
  }
}
  import 'package:flutter/material.dart';
  import 'package:user_homepage/main.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

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
          "HISTORY",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          )
        ),
        actions: [
              PopupMenuButton<String>(
                icon: Icon(Icons.menu, color: Colors.white),
                offset: Offset(0, 40),
                onSelected: (value) {
                  // Lakukan sesuatu berdasarkan pilihan
                  print(value);
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      value: 'group',
                      child: ListTile(
                        leading: Icon(Icons.group),
                        title: Text('Grup baru'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'broadcast',
                      child: ListTile(
                        leading: Icon(Icons.campaign),
                        title: Text('Siaran baru'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'linked_devices',
                      child: ListTile(
                        leading: Icon(Icons.devices),
                        title: Text('Perangkat tertaut'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'starred_messages',
                      child: ListTile(
                        leading: Icon(Icons.star),
                        title: Text('Pesan berbintang'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'settings',
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Setelan'),
                      ),
                    ),
                  ];
                },
              ),
        ],
        backgroundColor: Color(0xFF018ABE),
      ),
    );
  }
}
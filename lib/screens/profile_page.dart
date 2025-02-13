import 'package:flutter/material.dart';
import 'package:user_homepage/main.dart';
import 'package:user_homepage/screens/editprofile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF018ABE),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const UserHomepage()),
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          "PROFILE",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu, color: Colors.white),
            offset: const Offset(0, 40),
            onSelected: (value) {
              // Handle menu selection
              debugPrint(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'group',
                  child: ListTile(
                    leading: Icon(Icons.group),
                    title: Text('New Group'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'broadcast',
                  child: ListTile(
                    leading: Icon(Icons.campaign),
                    title: Text('New Broadcast'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'linked_devices',
                  child: ListTile(
                    leading: Icon(Icons.devices),
                    title: Text('Linked Devices'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'starred_messages',
                  child: ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Starred Messages'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'settings',
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                ),
              ];
            },
          ),
        ],
        backgroundColor: const Color(0xFF018ABE),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const ProfilePic(image: "https://i.postimg.cc/cCsYDjvj/user-2.png"),
            Text(
              "Administrator",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              height: 32.0,
              color: Colors.white24,
            ),
            const Info(
              infoKey: "User ID",
              info: "@admin",
            ),
            const Info(
              infoKey: "Location",
              info: "Lumajang",
            ),
            const Info(
              infoKey: "Phone",
              info: "+62 8123456789",
            ),
            const Info(
              infoKey: "Email Address",
              info: "admin@mail.com",
            ),
            const SizedBox(height: 24.0),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 160,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF018ABE),
                    minimumSize: const Size(double.infinity, 48),
                    shape: const StadiumBorder(),
                    elevation: 2,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditProfile()),
                    );
                  },
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
    required this.image,
    this.isShowPhotoUpload = true,
    this.imageUploadBtnPress,
  });

  final String image;
  final bool isShowPhotoUpload;
  final VoidCallback? imageUploadBtnPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white24,
          width: 2,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(image),
          ),
          if (isShowPhotoUpload)
            InkWell(
              onTap: imageUploadBtnPress,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add_a_photo,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.infoKey,
    required this.info,
  });

  final String infoKey, info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            infoKey,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          Text(
            info,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:user_homepage/main.dart';
import 'package:user_homepage/screens/editprofile.dart';
import 'package:user_homepage/screens/widget/popupmenu.dart';


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
          CustomPopupMenu(),
          
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
              "User",
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
              info: "@user",
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
              info: "usern@mail.com",
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
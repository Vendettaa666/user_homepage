import 'package:flutter/material.dart';
import 'package:user_homepage/main.dart';
import 'package:user_homepage/screens/widget/popupmenu.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: const Color(0xFF018ABE),
        scaffoldBackgroundColor: const Color(0xFF018ABE),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF00BF6D).withOpacity(0.05),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0 * 1.5,
            vertical: 16.0,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 48),
            shape: const StadiumBorder(),
          ),
        ),
      ),
      child: Scaffold(
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
              ProfilePic(
                image: 'https://i.postimg.cc/cCsYDjvj/user-2.png',
                imageUploadBtnPress: () {},
              ),
              const Divider(color: Colors.white24),
              Form(
                child: Column(
                  children: [
                    UserInfoEditField(
                      text: "Name",
                      child: TextFormField(
                        initialValue: "Annette Black",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    UserInfoEditField(
                      text: "Email",
                      child: TextFormField(
                        initialValue: "annette@gmail.com",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    UserInfoEditField(
                      text: "Phone",
                      child: TextFormField(
                        initialValue: "(316) 555-0116",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    UserInfoEditField(
                      text: "Address",
                      child: TextFormField(
                        initialValue: "New York, NVC",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    UserInfoEditField(
                      text: "Old Password",
                      child: TextFormField(
                        obscureText: true,
                        initialValue: "demopass",
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            size: 20,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                    UserInfoEditField(
                      text: "New Password",
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "New Password",
                          hintStyle: TextStyle(color: Colors.white60),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.2),
                      ),
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  SizedBox(
                    width: 160,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00BF6D),
                      ),
                      onPressed: () {
                        showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('BERHASIL MENGUBAH'),
                  content: const Text('Profile berhasil diubah'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
                    ),
                  ],
                );
              },
            );
                      },
                      child: const Text("Save Update"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
    required this.image,
    this.isShowPhotoUpload = false,
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
          color: Colors.white.withOpacity(0.2),
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(image),
          ),
          InkWell(
            onTap: imageUploadBtnPress,
            child: CircleAvatar(
              radius: 13,
              backgroundColor: const Color(0xFF00BF6D),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class UserInfoEditField extends StatelessWidget {
  const UserInfoEditField({
    super.key,
    required this.text,
    required this.child,
  });

  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0 / 2),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            flex: 3,
            child: child,
          ),
        ],
      ),
    );
  }
}
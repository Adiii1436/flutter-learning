import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://images.squarespace-cdn.com/content/v1/55951ce0e4b0c1a90569cfed/1584542431563-VU5W1ZPY4E8J9WZ8BX4C/dale-edwin-murray-illustration-illustrator-freelance-magazine-editorial-revolt-portrait-3.jpg?format=1000w";

    return Drawer(
      child: Container(
          color: Colors.black87,
          child: ListView(
            children: [
              DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,
                    decoration: BoxDecoration(
                        // * color: Colors.lightBlue,
                        ),
                    accountName: Text(
                      'Aditya Anand',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    accountEmail: Text(
                      'adianand2002@gmail.com',
                      style: TextStyle(color: Colors.white),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                  )),
              ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text(
                  "Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.ant_circle,
                  color: Colors.white,
                ),
                title: Text(
                  "Bug",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }
}

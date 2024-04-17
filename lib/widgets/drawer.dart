import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final url = "data:image/jpeg;base64,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";
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(

          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,

                  ),
                  arrowColor: Colors.blue,
                  margin: EdgeInsets.zero,
                  accountName: Text("Capital",style: TextStyle(color: Colors.black),),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(url),
                  ),
                  accountEmail: Text("skprogramminghi@gmail.com",style: TextStyle(color: Colors.black),),
                )
            ),
            ListTile(
              title: Text("Home",textScaler: TextScaler.linear(1.2),),
              leading: Icon(Icons.home),

            ),
            ListTile(
              title: Text("Profile",textScaler: TextScaler.linear(1.2),),
              leading: Icon(CupertinoIcons.profile_circled),

            ),
            ListTile(
              title: Text("Email me",textScaler: TextScaler.linear(1.2),),
              leading: Icon(Icons.email),

            ),


          ],
        ),
      ),
    );
  }
}

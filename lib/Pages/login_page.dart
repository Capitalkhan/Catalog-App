import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../routes/route.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _textController = TextEditingController();

  bool _changeText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/image/hey.png',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Column(
                children: [
                  TextFormField(
                    controller: _textController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter Username',
                      labelText: 'Username',
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      labelText: 'Password',
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: InkWell(
                onTap: () async {
                  setState(() {
                    _changeText = true;
                  });
                  await Future.delayed(Duration(seconds: 1));
                  await Navigator.of(context).pushNamed(MyRoutes.homeroute);
                  setState(() {
                    _changeText = false;
                  },);
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 50,
                  width: _changeText ? 50 : 160,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: _changeText
                      ? Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                      : Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ),

            // ElevatedButton(
            //   onPressed: () {
            //     setState(() {
            //       _changeText = true;
            //     });
            //     print(_textController.text);
            //     // Navigator.of(context).pushNamed(MyRoutes.homeroute);
            //   },
            //   style: TextButton.styleFrom(
            //     backgroundColor: Colors.deepPurple,
            //     minimumSize: _changeText? Size(50, 50) : Size(150, 40),
            //   ),
            //   child: Text(
            //     "Login",
            //     style: TextStyle(
            //       color: Colors.white,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

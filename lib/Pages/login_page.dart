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
  String name = "";

  final _formKey = GlobalKey<FormState>();

  void moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _changeText = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.of(context).pushNamed(MyRoutes.homeroute);
      setState(
        () {
          _changeText = false;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                "Welcome $name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _textController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'Enter Username',
                        labelText: 'Username',
                      ),
                      onChanged: (value) {
                        setState(() {
                          name = _textController.text;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide username';
                        }
                        if (value.length < 5) {
                          return "username must contain 5 characters";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide password';
                        }
                        if (value.length < 6) {
                          return "password must contain 6 character";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Material(

                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(50),
                  child: InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 50,
                      width: _changeText ? 50 : 160,
                      alignment: Alignment.center,

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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class UserCredentials {
  final String email;
  final String password;

  UserCredentials(this.email, this.password);
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();


  Timestamp (){
    DateTime startDate = DateTime.now().toLocal();
    var date5 = DateFormat.yMMMd().format(startDate);
    print("****************Login_Date***************** $date5");

    String tdata = DateFormat("HH:mm:ss").format(DateTime.now());
    print("****************Login_Time***************** $tdata");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/glass.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 120),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final credentials = UserCredentials(
                        _usernameController.text,
                        _passwordController.text,
                      );
                      if (isValidCredentials(credentials)) {
                        Navigator.pushNamed(context, 'home');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Invalid credentials')),
                        );
                      }
                    }
                    Timestamp();
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidCredentials(UserCredentials credentials) {
    return credentials.email == 'innojc@gmail.com' &&
        credentials.password == 'innojc@123';
  }

  void showAlert() {
    QuickAlert.show(
        context: context,
        title: "Login",
        text: "successful",
        type: QuickAlertType.success);
  }
}

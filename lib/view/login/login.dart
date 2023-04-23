import 'package:flutter/material.dart';
import 'package:flutter_challenge/view_model/login/login_view_model.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _error = false;
  bool _isLoading = false;
  String? errorMessage;
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : buildLogin()
      
    );
  }


  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final username = userController.text.trim();
      final password = passwordController.text.trim();

      try {
        final userModel = await HttpLogin.login(username, password);
        setState(() {
          _error = false;
          Navigator.pushNamed(context, '/home',
          arguments: {
            'user': userModel,
          });
        });
      } catch (error) {
        _error = true;
        errorMessage = "Usuario o contraseña invalido. Intente de nuevo.";
      }

      setState(() {
        _isLoading = false;
      });
    }
  }


  Widget buildLogin(){
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 40),
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                  scale: 0.5,
              )
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text('Bienvenido',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
                )
              ),             
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                cursorColor: Colors.white,
                controller: userController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  labelText: 'Usuario ',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(      
                cursorColor: Colors.white,
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(!_error ? '' : 'Humm ? $errorMessage',
                style: const TextStyle(
                  fontSize: 15, 
                  color: Colors.white54
                ),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: _login,
                child: const Text('Ingresar'),  
              )
            ),
          ],
        ),
      )
    );
  }

  
}

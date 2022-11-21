import 'package:f_testing_template/services/auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String dropdownValue = 'Tienda';
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/back.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset('assets/images/logo.png')),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 500,
                    height: 240,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 154, 154, 154),
                          offset: Offset(0.0, 10.0),
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          TextFormField(
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            key: const Key('TextFormFieldLoginEmail'),
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'ID',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter email";
                              } else if (!value.contains('@')) {
                                return "Enter valid email address";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            style: const TextStyle(
                                fontSize: 20, /* fontWeight: FontWeight.bold */),
                            key: const Key('TextFormFieldLoginPassword'),
                            controller: _passwordController,
                            decoration:
                                const InputDecoration(labelText: "Contraseña"),
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter password";
                              } else if (value.length < 6) {
                                return "Password should have at least 6 characters";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 380,
                    height: 50,
                    child: OutlinedButton(
                      key: const Key('ButtonLoginSubmit'),
                      onPressed: () async {
                        // this line dismiss the keyboard by taking away the focus of the TextFormField and giving it to an unused
                        FocusScope.of(context).requestFocus(FocusNode());
                        final form = _formKey.currentState;
                        form!.save();
                        if (form.validate()) {
                          dynamic result =
                              await _auth.signInWithEmailAndPassword(
                                  _emailController.text,
                                  _passwordController.text);
                          if (result == null) {
                            const snackBar = SnackBar(
                              content: Text('Validación Erronea'),
                            );
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } else {
                          const snackBar = SnackBar(
                            content: Text('Validación Erronea'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: const Color(0xFF00BE5D),
                        elevation: 15.0,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                      ),
                      child: const Text(
                        "Iniciar Seción",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                      key: const Key('ButtonLoginCreateAccount'),
                      onPressed: () => {widget.toggleView()},
                      child: const Text(
                        'Registrarse',
                        style: TextStyle(
                            color: Color(0xFFA7A7A7),
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      )),
                  /* SizedBox(
                    width: 100,
                    height: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const ListTiendas();
                          },
                        ));
                      },
                      child: const Text("client view"),
                    ),
                  ), */
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

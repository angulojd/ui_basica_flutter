import 'package:f_testing_template/domain/entities/tienda_entidad.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../content/Tienda/home_tienda.dart';
import '../content/Cliente/home_cliente.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
   const LoginScreen({Key? key, required this.entidad})
      : super(key: key);

  final TiendaEnt entidad;
  

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String dropdownValue = 'Tienda';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 90.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/tienda.png')),
                const Text(
                  "MÉRCATE",
                  style: TextStyle(fontSize: 20),
                ),

                const SizedBox(
                  height: 20,
                ),

                TextFormField(
                  key: const Key('TextFormFieldLoginEmail'),
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
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
                  key: const Key('TextFormFieldLoginPassword'),
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: "Password"),
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

                const SizedBox(
                  height: 20,
                ),

                DropdownButtonFormField(
                  key: const Key('TextFormFieldDropdown'),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder( //<-- SEE HERE
                      borderSide: BorderSide(color: Color.fromARGB(255, 136, 136, 136), width: 0),
                    ),
                    focusedBorder: OutlineInputBorder( //<-- SEE HERE
                      borderSide: BorderSide(color: Color.fromARGB(255, 136, 136, 136), width: 0),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  dropdownColor: const Color.fromARGB(255, 255, 255, 255),
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Tienda', 'Cliente'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 380,
                  height: 50,
                  child: OutlinedButton(
                      key: const Key('ButtonLoginSubmit'),
                      onPressed: () {
                        // this line dismiss the keyboard by taking away the focus of the TextFormField and giving it to an unused
                        FocusScope.of(context).requestFocus(FocusNode());
                        final form = _formKey.currentState;
                        form!.save();
                        if (form.validate()) {
                          if (widget.entidad.email == _emailController.text &&
                              widget.entidad.password == _passwordController.text &&
                              widget.entidad.type == dropdownValue) {
                                if (widget.entidad.type == "Tienda") {
                                    Get.to(() => HomePageTienda(
                                    key: const Key('HomePageTienda'),
                                    entidad: widget.entidad,
                                    ));
                                } else {
                                    Get.to(() => HomePageCliente(
                                    key: const Key('HomePageCliente'),
                                    entidad: widget.entidad,
                                    ));
                                }
                          } else {
                            const snackBar = SnackBar(
                              content: Text('User or passwor nok'),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        } else {
                          const snackBar = SnackBar(
                            content: Text('Validation nok'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      child: const Text("LOGIN"),
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    key: const Key('ButtonLoginCreateAccount'),
                    onPressed: () => Get.to(const SignUpPage(
                          key: Key('SignUpPage'),
                        )),
                    child: const Text('Create Account'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

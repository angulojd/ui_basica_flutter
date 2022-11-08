import 'package:f_testing_template/services/auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _dirController = TextEditingController();
  final _passwordController = TextEditingController();

  String dropdownValue = 'Tienda';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: elegir color,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // backgroundColor: elegir,
        title: const Text("Create account with email"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 60.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  key: const Key('TextFormFieldS'),
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: const Key('TextFormFieldSignUpEmail'),
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  // ignore: body_might_complete_normally_nullable
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter email";
                    } else if (!value.contains('@')) {
                      return "Enter valid email address";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: const Key('TextFormFieldSignUpPassword'),
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
                TextFormField(
                  key: const Key('TextFormFi'),
                  controller: _dirController,
                  decoration: const InputDecoration(labelText: 'Dir'),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  width: 371,
                  child: DropdownButtonFormField(
                    key: const Key('TextFormFieldDropdown'),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 136, 136, 136),
                            width: 0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 136, 136, 136),
                            width: 0),
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
                    items: <String>['Tienda', 'Cliente']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                OutlinedButton(
                    key: const Key('ButtonSignUpSubmit'),
                    onPressed: () async {
                      // this line dismiss the keyboard by taking away the focus of the TextFormField and giving it to an unused
                      FocusScope.of(context).requestFocus(FocusNode());
                      final form = _formKey.currentState;
                      form!.save();
                      if (form.validate()) {
                        dynamic result =
                            await _auth.registerWithEmailAndPassword(
                          // _nameController.text,
                          _emailController.text,
                          _passwordController.text,
                          // _dirController.text,
                          // dropdownValue
                        );

                        await _auth.signOut();

                        /* Get.to(() => LoginScreen(
                            key: const Key('LoginScreen'))); */

                        if (result == null) {
                          // ignore: avoid_print
                          print(
                              "Resultado no valido en la validación del formulario");
                        }
                      } else {
                        const snackBar = SnackBar(
                          content: Text('Validation nok'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text("Submit")),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    key: const Key('ButtonLoginsing'),
                    onPressed: () => {
                          widget.toggleView()
                          // await _auth.signOut(),
                          /* Get.to(const SignUpPage(
                            key: Key('SignUpPage'),
                          )) */
                        },
                    child: const Text('login screen')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

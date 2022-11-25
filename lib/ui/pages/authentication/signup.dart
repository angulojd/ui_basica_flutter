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
            padding: const EdgeInsets.fromLTRB(20.0, 130.0, 20.0, 60.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: 500,
                    height: 460,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          style: const TextStyle(
                            fontSize: 19,
                          ),
                          key: const Key('TextFormFieldS'),
                          controller: _nameController,
                          decoration:
                              const InputDecoration(labelText: 'Nombre'),
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter name";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            fontSize: 19,
                          ),
                          key: const Key('TextFormFieldSignUpEmail'),
                          controller: _emailController,
                          decoration: const InputDecoration(labelText: 'Email'),
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter email";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            fontSize: 19,
                          ),
                          key: const Key('TextFormFieldSignUpPassword'),
                          controller: _passwordController,
                          decoration:
                              const InputDecoration(labelText: "Password"),
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
                          height: 5,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            fontSize: 19,
                          ),
                          key: const Key('TextFormFi'),
                          controller: _dirController,
                          decoration: const InputDecoration(labelText: 'Dir'),
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter location";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 13,
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
                                    color: Color(0xFF00BE5D), width: 50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                //<-- SEE HERE
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 161, 161, 161),
                                    width: 1),
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(255, 255, 255, 255),
                            ),
                            dropdownColor:
                                const Color.fromARGB(255, 255, 255, 255),
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
                                  style: const TextStyle(
                                      fontSize: 17,
                                      color:
                                          Color.fromARGB(255, 110, 110, 110)),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 250,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 15.0,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                        ),
                        key: const Key('ButtonSignUpSubmit'),
                        onPressed: () async {
                          // this line dismiss the keyboard by taking away the focus of the TextFormField and giving it to an unused
                          FocusScope.of(context).requestFocus(FocusNode());
                          final form = _formKey.currentState;
                          form!.save();
                          if (form.validate()) {
                            dynamic result =
                                await _auth.registerWithEmailAndPassword(
                                    _nameController.text,
                                    _emailController.text,
                                    _passwordController.text,
                                    _dirController.text,
                                    dropdownValue);
                            widget.toggleView();
                            await _auth.signOut();
                            
                            if (result == null) {
                              // ignore: avoid_print
                              print(
                                  "Resultado no valido en la validación del formulario");
                            }
                          } else {
                            const snackBar = SnackBar(
                              content: Text('Validation Erronea'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: const Text(
                          "Enviar",
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                      key: const Key('ButtonLoginsing'),
                      onPressed: () => {widget.toggleView()},
                      child: const Text(
                        'login screen',
                        style: TextStyle(
                          color: Color(0xFFA7A7A7),
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                        ),
                        )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

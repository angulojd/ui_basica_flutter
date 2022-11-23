import 'package:flutter/material.dart';

class SalaEspera extends StatelessWidget {
  const SalaEspera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/mercado.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text("Bienvenidx!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 65,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
                Text("En breve serás redirigido",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30,
                ),

                SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 10,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_demo/Formulario.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController txtUserNameController = TextEditingController();
  TextEditingController txtUserPwdController = TextEditingController();
  String uname = 'demo@gmail.com';
  String pass = '12345';

  @override
  Widget createLoginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: ElevatedButton(
        child: Text('Ingresar'),
        onPressed: () {
          if (uname == txtUserNameController.text &&
              pass == txtUserPwdController.text) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EscritorioCRUD(),
                ));
          }
        },
      ),
    );
  }

  Widget renderCreateAccountLink() {
    return Container(
        padding: EdgeInsets.only(top: 30),
        child: const Text(
          'Registrate como vendedor',
          textAlign: TextAlign.right,
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
  }

/*Widget rDivider(){
  return Container(
    padding: const EdgeInsets.only(top: 30),
    child: Row(children: [
        Expanded(child: Divider(height: 1,)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:10),
          child: Text(''),
        ),
        Divider(height: 1)
      ],
    ),
  );
}*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Card(
        child: Column(
          children: [
            Image.asset('assets/images/claro-logo-8.png', height: 300),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 3),
              child: TextFormField(
                controller: txtUserNameController,
                decoration: InputDecoration(
                    hintText: 'Usuario o Correo electronico',
                    icon: Icon(Icons.email)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 3),
              child: TextFormField(
                controller: txtUserPwdController,
                decoration: InputDecoration(
                    hintText: 'Contraseña', icon: Icon(Icons.lock)),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: ElevatedButton(
                  child: Text('Ingresar'),
                  onPressed: () {
                    if (uname == txtUserNameController.text &&
                        pass == txtUserPwdController.text) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EscritorioCRUD(),
                          ));
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Error'),
                          content: Text(
                              'Por favor ingresar un usuario o contraseña valida'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop('Ok');
                              },
                              child: Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Esquema_C extends StatefulWidget {
  const Esquema_C({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  @override
  State<Esquema_C> createState() => _Esquema_C_State();
}

class _Esquema_C_State extends State<Esquema_C> {
  //constroladores de campo de texto
  final txtCampo1 = TextEditingController();
  final txtCampo2 = TextEditingController();
  final txtCampo3 = TextEditingController();
  final txtCampo4 = TextEditingController();
  final txtCampo5 = TextEditingController();

  final fechai = new DateFormat('yyyy-MM-dd');
  final fechaf = new DateFormat('yyyy-MM-dd');

  //establecer la referencia a la base de datos
  CollectionReference dato =
      FirebaseFirestore.instance.collection('UsuarioProject');

  //metodo para insertar un registro
  Future<void> addRegistro() {
    return dato
        .doc(txtCampo1.text)
        .set({
          'titulo': txtCampo1.text,
          'nombres': txtCampo2.text,
          'descripcion': txtCampo3.text,
          'beneficios': txtCampo4.text,
          'area': txtCampo5.text,
          'comentarios': "",
          'estado': "presentada",
          'presupuesto': "",
          'fechaI': "",
          'actividad1': "",
          'actividad2': "",
          'actividad3': "",
          'actividad4': "",
          'fechaF': ""
        })
        .then((value) => print("Registro adicionado con exito"))
        .catchError((error) => print("Algo salio mal: $error"));

    //return dato.add({'Campo1': txtCampo1.text, 'Campo2': txtCampo2.text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: SingleChildScrollView(
            //formulario
            child: Column(
              children: [
                //Titulo1:
                const ListTile(
                  leading: Icon(Icons.task, size: 60, color: Colors.red),
                  title: Text(
                    'Registrar proyecto',
                    style: TextStyle(fontSize: 25),
                  ),
                  subtitle: Text('Animate y envia tu idea '),
                ),
                //---------------------------

                //campos del formulario
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  child: TextFormField(
                    controller: txtCampo1,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.batch_prediction),
                      border: UnderlineInputBorder(),
                      labelText: 'Titulo del proyecto',
                    ),
                  ),
                ),
                //-------------------------
                //campos del formulario
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  child: TextFormField(
                    controller: txtCampo2,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.assignment_ind_outlined),
                      border: UnderlineInputBorder(),
                      labelText: 'Nombres del proponente',
                    ),
                  ),
                ),
                //-------------------------
                //campos del formulario
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  child: TextFormField(
                    controller: txtCampo3,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.app_registration_outlined),
                      border: UnderlineInputBorder(),
                      labelText: 'Corta descripcion',
                    ),
                  ),
                ),
                //-------------------------
                //campos del formulario
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  child: TextFormField(
                    controller: txtCampo4,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.attractions_outlined),
                      border: UnderlineInputBorder(),
                      labelText: 'Beneficios',
                    ),
                  ),
                ),
                //-------------------------
                //campos del formulario
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  child: TextFormField(
                    controller: txtCampo5,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.assistant_photo),
                      border: UnderlineInputBorder(),
                      labelText: 'Area de mayor impacto',
                    ),
                  ),
                ),
                //-------------------------
                //campos del formulario

                //-------------------------
                //botones de envio
                TextButton(
                  child: Text('Enviar', style: TextStyle(fontSize: 30)),
                  onPressed: () {
                    addRegistro();
                    this.txtCampo1.text = "";
                    this.txtCampo2.text = "";
                    this.txtCampo3.text = "";
                    this.txtCampo4.text = "";
                    this.txtCampo5.text = "";
                  },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      primary: Color.fromARGB(255, 0, 0, 0),
                      elevation: 2,
                      backgroundColor: Color.fromARGB(255, 244, 67, 54)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

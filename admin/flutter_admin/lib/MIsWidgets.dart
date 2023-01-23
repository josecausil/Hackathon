

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/Propuesta.dart';
import 'package:flutter_admin/modulos/Create.dart';

class BarraTitulo extends StatelessWidget {
  const BarraTitulo({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const ImageIcon(
        AssetImage('assets/images/claro-logo.png'),
        //AssetImage('assets/images/claro-logo-8.png'),
        color: Colors.white,
      ),
      const SizedBox(
        width: 10.5,
      ),
      Text(this.titulo),
    ]);
  }
}

//---------------------------------------------------
class registro_visual extends StatefulWidget {
  registro_visual(
      {Key? key,
      required this.titulo,
      required this.nombres,
      required this.descripcion,
      required this.beneficios,
      required this.area,
      required this.estado,
      required this.comentarios})
      : super(key: key);
  final String titulo;
  final String nombres;
  final String descripcion;
  final String beneficios;
  final String area;
  final String comentarios;
  final String estado;
  final txtComentarios = TextEditingController();
  final txtEstado = TextEditingController();

  //establecer la referencia a la base de datos
  CollectionReference dato =
      FirebaseFirestore.instance.collection('UsuarioProject');

  //metodo para insertar un registro

  Future<void> updateRegistro(documento, estado) {
    return dato
        .doc(documento)
        .update({'estado': estado, 'comentarios': txtComentarios.text})
        .then((value) => print("Registro se actualizo con exito"))
        .catchError((error) => print("Algo salio mal: $error"));

    //return dato.add({'Campo1': txtCampo1.text, 'Campo2': txtCampo2.text});
  }

  @override
  State<registro_visual> createState() => _registro_visual();
}

class _registro_visual extends State<registro_visual> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // Icon(Icons.adb),
            Text('Proponente : ${widget.nombres}'),
          ],
        ),
        //-------------------------------------
        Row(
          children: [
            // Icon(Icons.adb),
            Text('Descripcion : ${widget.descripcion}'),
          ],
        ),

        //---------------------------------------
        Row(
          children: [
            // Icon(Icons.adb),
            Text('Beneficios : ${widget.beneficios}'),
          ],
        ),

        //---------------------------------------
        Row(
          children: [
            // Icon(Icons.adb),
            Text('Area : ${widget.area}'),
          ],
        ),
        //--------------------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
          child: TextFormField(
            controller: widget.txtComentarios,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Ingrese Anotaciones',
            ),
          ),
        ),

        //---------------------------------
        //campos del formulario
        Row(
          children: [
            // Icon(Icons.adb),
            Text('Estado : ${widget.estado}'),
          ],
        ),

        //------------------------
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              child: IconButton(
                icon: const Icon(Icons.check_circle_outline),
                tooltip: 'Aprobar',
                onPressed: () {
                  setState(() {
                    widget.updateRegistro(widget.titulo, 'evaluada');
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0),
              child: IconButton(
                icon: const Icon(Icons.border_color_sharp),
                tooltip: 'Se debe modificar',
                onPressed: () {
                  setState(() {
                    widget.updateRegistro(widget.titulo, 'modificaciones');
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

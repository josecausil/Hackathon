

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/Propuesta.dart';
import 'package:flutter_admin/modulos/Create.dart';

//---------------------------------------------------
class registro_visualapro extends StatefulWidget {
  registro_visualapro(
      {Key? key,
      required this.titulo,
      required this.nombres,
      required this.descripcion,
      required this.beneficios,
      required this.area,
      required this.estado,
      required this.comentarios,
      required this.presupuesto})
      : super(key: key);
  final String titulo;
  final String nombres;
  final String descripcion;
  final String beneficios;
  final String area;
  final String comentarios;
  final String estado;
  final String presupuesto;
  final txtComentarios = TextEditingController();

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
  State<registro_visualapro> createState() => _registro_visual();
}

class _registro_visual extends State<registro_visualapro> {
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

        //---------------------------------

        //------------------------------------
        //campos del formulario
        Row(
          children: [
            // Icon(Icons.adb),
            Text('Estado : ${widget.estado}'),
          ],
        ),

        Row(
          children: [
            // Icon(Icons.adb),
            Text('Presupuesto utilizado : ${widget.presupuesto}'),
          ],
        ),

        //------------------------
      ],
    );
  }
}

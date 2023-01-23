
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
class registro_visualmmo extends StatefulWidget {
  registro_visualmmo(
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

  @override
  State<registro_visualmmo> createState() => _registro_visual();
}

class _registro_visual extends State<registro_visualmmo> {
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
        //campos del formulario
        Row(
          children: [
            // Icon(Icons.adb),
            Text('Estado : ${widget.estado}'),
          ],
        ),

        //------------------------
      ],
    );
  }
}

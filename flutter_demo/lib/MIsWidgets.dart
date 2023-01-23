import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
      required this.comentarios,
      required this.estado})
      : super(key: key);
  final String titulo;
  final String nombres;
  final String descripcion;
  final String beneficios;
  final String area;
  final String comentarios;
  final String estado;

  //establecer la referencia a la base de datos
  CollectionReference dato =
      FirebaseFirestore.instance.collection('UsuarioProject');

  //metodo para insertar un registro

  @override
  State<registro_visual> createState() => _registro_visual();
}

class _registro_visual extends State<registro_visual> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Proponente : ${widget.nombres}',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        //-------------------------------------

        //---------------------------------------

        //---------------------------------------
        Row(
          children: [
            Text(
              'Area : ${widget.area}',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),

        //---------------------------------
        //campos del formulario
        Row(
          children: [
            Text(
              'Comentarios : ${widget.comentarios}',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        //-------------------------

        Row(
          children: [
            Text(
              'Estado : ${widget.estado}',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 255, 4, 4),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),

        //-------------------------
      ],
    );
  }
}

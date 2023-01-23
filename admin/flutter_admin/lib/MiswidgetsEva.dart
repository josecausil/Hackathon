

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';


//---------------------------------------------------
class registro_visualeva extends StatefulWidget {
  registro_visualeva(
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
  final txtPresupuesto = TextEditingController();
  final txtActividad1 = TextEditingController();
  final txtActividad2 = TextEditingController();
  final txtActividad3 = TextEditingController();
  final txtActividad4 = TextEditingController();
  final fecha1 = TextEditingController();
  final fecha4 = TextEditingController();

  //establecer la referencia a la base de datos
  CollectionReference dato =
      FirebaseFirestore.instance.collection('UsuarioProject');

  //metodo para insertar un registro

  Future<void> updateRegistro(
    documento,
    estado,
  ) {
    return dato
        .doc(documento)
        .update({
          'estado': estado,
          'comentarios': txtComentarios.text,
          'presupuesto': txtPresupuesto.text,
          'actividad1': txtActividad1.text,
          'actividad2': txtActividad2.text,
          'actividad3': txtActividad3.text,
          'actividad4': txtActividad4.text,
          'fechaI': fecha1.text,
          'fechaF': fecha1.text
        })
        .then((value) => print("Registro se actualizo con exito"))
        .catchError((error) => print("Algo salio mal: $error"));

    //return dato.add({'Campo1': txtCampo1.text, 'Campo2': txtCampo2.text});
  }

  @override
  State<registro_visualeva> createState() => _registro_visual();
}

class _registro_visual extends State<registro_visualeva> {
  final format = DateFormat("yyyy-MM-dd");
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
          child: TextFormField(
            controller: widget.txtPresupuesto,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Ingrese Presupuesto',
            ),
          ),
        ),
        //------------------------
        Row(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 500),
              child: DateTimeField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Fecha Inicial',
                ),
                controller: widget.fecha4,
                format: format,
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                },
              ),
            ),
          ],
        ),

        //------------------------------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
          child: TextFormField(
            controller: widget.txtActividad1,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Actividad 1',
            ),
          ),
        ),

        //----------------------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
          child: TextFormField(
            controller: widget.txtActividad2,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Actividad 2',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
          child: TextFormField(
            controller: widget.txtActividad3,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Actividad 3',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
          child: TextFormField(
            controller: widget.txtActividad4,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Actividad 4',
            ),
          ),
        ),
        //---------------------

        //------------------------
        Row(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 500),
              child: DateTimeField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Fecha Final',
                ),
                controller: widget.fecha1,
                format: format,
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                },
              ),
            ),
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
                    widget.updateRegistro(widget.titulo, 'en desarrollo');
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0),
              child: IconButton(
                icon: const Icon(Icons.block_outlined),
                tooltip: 'Rechazar',
                onPressed: () {
                  setState(() {
                    widget.updateRegistro(widget.titulo, 'rechazada');
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

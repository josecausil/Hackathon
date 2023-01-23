import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_admin/MiWidgetsapro.dart';

import '../MIsWidgets.dart';

class Esquema_RTer extends StatefulWidget {
  const Esquema_RTer({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  @override
  State<Esquema_RTer> createState() => _Esquema_R_State();
}

class _Esquema_R_State extends State<Esquema_RTer> {
  Stream<QuerySnapshot> _consultaStream =
      FirebaseFirestore.instance.collection('UsuarioProject').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _consultaStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('==============ERROR===========');
            return const Text('upsss, algo salio mal');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            print('===========LOAD INFO==========');
            return const Text('Cargando los datos ...');
          }

          print('==============estamos ok============');

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              var estado = ' ${data['estado']}';
              if (estado.endsWith('terminada')) {
                return ListTile(
                  title: Text('Titulo del proyecto:  ${data['titulo']}'),
                  subtitle: registro_visualapro(
                      titulo: data['titulo'],
                      nombres: data['nombres'],
                      descripcion: data['descripcion'],
                      beneficios: data['beneficios'],
                      area: data['area'],
                      comentarios: data['comentarios'],
                      estado: data['estado'],
                      presupuesto: data['presupuesto']),
                );
              }

              return ListTile();
            }).toList(),
          );
        });
  }
}

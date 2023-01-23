import 'package:flutter/material.dart';
import 'package:flutter_demo/MIsWidgets.dart';

import 'modulos/Create.dart';
import 'modulos/Read.dart';

class EstructuraBasica extends StatefulWidget {
  const EstructuraBasica({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  State<EstructuraBasica> createState() => _EstructuraBasica();
}

class _EstructuraBasica extends State<EstructuraBasica> {
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: BarraTitulo(titulo: widget.titulo),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                  text: 'Formulario de inscripcion',
                  icon: Icon(Icons.format_align_justify)),
              Tab(
                  text: 'Estado de la propuesta',
                  icon: Icon(Icons.dataset_rounded)),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Esquema_C(titulo: 'Esquema C de Crud'),
            ),
            Center(
              child: Esquema_R(titulo: 'Esquema R de cRud'),
            ),
          ],
        ),
      ),
    );
  }
}

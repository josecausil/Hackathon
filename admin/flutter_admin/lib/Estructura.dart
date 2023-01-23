import 'package:flutter/material.dart';
import 'package:flutter_admin/MIsWidgets.dart';
import 'package:flutter_admin/modulos/ReadDes.dart';
import 'package:flutter_admin/modulos/ReadEval.dart';
import 'package:flutter_admin/modulos/ReadMod.dart';
import 'package:flutter_admin/modulos/ReadRech.dart';
import 'package:flutter_admin/modulos/ReadTer.dart';
import 'package:flutter_admin/modulos/Readapla.dart';

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
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: BarraTitulo(titulo: widget.titulo),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                  text: 'Propuestas presentadas',
                  icon: Icon(Icons.batch_prediction_outlined)),
              Tab(
                  text: 'Propuestas evaluadas',
                  icon: Icon(Icons.border_color_sharp)),
              Tab(
                  text: 'Propuestas en evaluacion',
                  icon: Icon(Icons.attach_money_outlined)),
              Tab(
                  text: 'Propuestas en desarrollo',
                  icon: Icon(Icons.build_rounded)),
              Tab(
                  text: 'Propuestas aplazadas',
                  icon: Icon(Icons.access_alarm_outlined)),
              Tab(
                  text: 'Propuestas terminadas',
                  icon: Icon(Icons.check_circle)),
              Tab(
                  text: 'Propuestas rechazadas',
                  icon: Icon(Icons.block_outlined)),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Esquema_R(titulo: 'Esquema R de Crud'),
            ),
            Center(
              child: Esquema_RMod(titulo: 'Esquema_RMod de cRud'),
            ),
            Center(
              child: Esquema_RE(titulo: 'Esquema_RE de Crud'),
            ),
            Center(
              child: Esquema_RDes(titulo: 'Esquema_RDes de cRud'),
            ),
            Center(
              child: Esquema_Rapla(titulo: 'Esquema_Rapla de Crud'),
            ),
            Center(
              child: Esquema_RTer(titulo: 'Esquema_RTer de cRud'),
            ),
            Center(
              child: Esquema_Rech(titulo: 'Esquema_Rech de cRud'),
            ),
          ],
        ),
      ),
    );
  }
}

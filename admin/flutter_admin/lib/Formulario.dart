import 'package:flutter/material.dart';

import 'Estructura.dart';

class EscritorioCRUD extends StatelessWidget {
  const EscritorioCRUD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const EstructuraBasica(titulo: 'Emprendimientos propuestos-CLARO'),
    );
  }
}

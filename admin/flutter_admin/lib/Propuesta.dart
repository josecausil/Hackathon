
import 'package:flutter/material.dart';
import 'package:flutter_admin/modulos/Create.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atras'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Esquema_C(
                    titulo: 'Editar',
                  ),
                ));
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

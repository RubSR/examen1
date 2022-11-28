import 'package:flutter/material.dart';

import '../models/nota.dart';

class NotaDetallePage extends StatelessWidget {
  Nota nota;
  NotaDetallePage({Key? key, required this.nota}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nota'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(nota.nombre),
                Text(nota.descripcion),
              ],
            ),
          ),
        ),
      )
    );
  }
}

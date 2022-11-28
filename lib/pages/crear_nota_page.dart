import 'package:examen1/models/nota.dart';
import 'package:flutter/material.dart';


class CrearNota extends StatelessWidget {
   CrearNota({Key? key}) : super(key: key);
  
  final TextEditingController _nombreCtrl = TextEditingController();
  final TextEditingController _descCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear nota'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nombreCtrl ,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                hintText: 'Escribe el nombre de la nota',
                label: const Text('Nombre')
              ),
            ),
            const SizedBox( height: 20),
            TextField(
              controller: _descCtrl ,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  hintText: 'Escribe la descripcion de la nota',
                  label: const Text('Descripcion')
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: (){
                  //Comprobar que los inputs tengan texto
                  if(_nombreCtrl.text.isNotEmpty && _descCtrl.text.isNotEmpty){
                   Nota nota = Nota(_nombreCtrl.text, _descCtrl.text);
                   Navigator.pop(context, nota);
                  }
                  },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                ),
                child: const  Text('Guardar'),
            )
          ],
        ),
      )
      ,
    );
  }
}

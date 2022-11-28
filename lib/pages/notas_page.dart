import 'package:examen1/pages/crear_nota_page.dart';
import 'package:examen1/pages/nota_detalle_page.dart';
import 'package:flutter/material.dart';

import '../models/nota.dart';


class NotasPage extends StatefulWidget {
  const NotasPage({Key? key}) : super(key: key);

  @override
  State<NotasPage> createState() => _NotasPageState();
}

class _NotasPageState extends State<NotasPage> {
  //Necesito la lista de notas
  List<Nota> notas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de notas'),
      ),
      body: ListView.builder(
          itemCount: notas.length,
          itemBuilder: (context, int i){
            return ListTile(
              onTap: (){
                //Navegar a la pantalla de detalles
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> NotaDetallePage(nota: notas[i])));
              },
              title: Text(notas[i].nombre),
              trailing: IconButton(
                icon:const Icon(Icons.remove_circle_outlined, color: Colors.red),
                onPressed: (){
                  //Es borrar la nota de la lista
                  setState(() {
                    notas.removeAt(i);
                  });
                },
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        child:  Icon(Icons.add),
        //Para desactivar un boton simplemente le pasamos null en la propiedad
        // onPressed
        onPressed:notas.length >=10 ? null :
        () async {
          //Ir a la pagina de añadir nota
          Nota? nota = await Navigator.push(context,
              MaterialPageRoute(builder: (context)=> CrearNota()));
          if(nota != null){
            setState(() {
              notas.add(nota);
            });
          }
        }
        ,
      ),
    );
  }
}



import 'package:covid19/datasource.dart';
import 'package:flutter/material.dart';

class PreguntasyRespuestas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Preguntas Frecuentes'),),

      body: ListView.builder(
          itemCount: DataSource.preguntasRespuestas.length,
          itemBuilder: (context,index) {
        return ExpansionTile(title: Text(DataSource.preguntasRespuestas[index]['pregunta'], style: TextStyle(fontWeight: FontWeight.bold),),children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(DataSource.preguntasRespuestas[index]['respuesta']),
          )
        ],);
    }),
    );
  }
}
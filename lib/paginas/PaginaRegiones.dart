import 'package:covid19/paginas/buscar.dart';
import 'package:covid19/paginas/buscarRegiones.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class PaginaRegiones extends StatefulWidget {
  @override
  _PaginaRegionesState createState() => _PaginaRegionesState();
}

class _PaginaRegionesState extends State<PaginaRegiones> {
  List DatosRegiones;
  buscarDatosPorRegiones() async {
    http.Response response =
    await http.get('http://codeunac.dx.am/region.json');
    setState(() {
      DatosRegiones = json.decode(response.body);
    });
  }

  @override
  void initState() {
    buscarDatosPorRegiones();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat("#,###");
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){

            showSearch(context: context, delegate: BuscarRegiones(DatosRegiones));

          },)
        ],
        title: Text('Estadisticas por regiones'),
      ),
      body: DatosRegiones == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemBuilder: (context, index) {
          return Card(     // contenedor en estadisticas de regiones
            child: Container(
              height: 130,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          DatosRegiones[index]['titulo'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'CONFIRMADOS: ' +
                                  nf.format(DatosRegiones[index]['activos']) ?? '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              'RECUPERADOS: ' +
                                  nf.format(DatosRegiones[index]['recuperado']) ?? '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            Text(
                              'DECESOS: ' +
                                  nf.format(DatosRegiones[index]['muertos']) ?? '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[250]),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        },
        itemCount: DatosRegiones == null ? 0 : DatosRegiones.length, //muestra toda la lista
      ),
    );
  }
}

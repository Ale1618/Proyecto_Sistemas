import 'package:covid19/paginas/buscar.dart';
import 'package:covid19/paginas/buscarEnLima.dart';
import 'package:covid19/paginas/buscarRegiones.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class PaginaLima extends StatefulWidget {
  @override
  _PaginaLimaState createState() => _PaginaLimaState();
}

class _PaginaLimaState extends State<PaginaLima> {
  List DatosLima;
  buscarDatosEnLima() async {
    http.Response response =
    await http.get('https://unac-covid.herokuapp.com/api/v1/provinces');
    setState(() {
      DatosLima = json.decode(response.body);
    });
  }

  @override
  void initState() {
    buscarDatosEnLima();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat("#,###");
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){

            showSearch(context: context, delegate: BuscarEnLima(DatosLima));

          },)
        ],
        title: Text('Estadisticas en Lima'),
      ),
      body: DatosLima == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemBuilder: (context, index) {
          return Card(     // contenedor en estadisticas de lima
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
                          DatosLima[index]['province'],
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
                                  nf.format(DatosLima[index]['cases']) ?? '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              'RECUPERADOS: ' +
                                  nf.format(DatosLima[index]['recovered']) ?? '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            Text(
                              'DECESOS: ' +
                                  nf.format(DatosLima[index]['deaths']) ?? '',
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
        itemCount: DatosLima == null ? 0 : DatosLima.length, //muestra toda la lista
      ),
    );
  }
}
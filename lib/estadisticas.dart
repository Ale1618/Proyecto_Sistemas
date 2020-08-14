import 'dart:convert';

import 'package:covid19/core/consts.dart';
import 'package:covid19/datasource.dart';
import 'package:covid19/paginas/PaginaPaises.dart';
import 'package:covid19/paginas/PaginaLima.dart';
import 'package:covid19/paginas/PaginaRegiones.dart';
import 'package:covid19/panels/PanelPeru.dart';
import 'package:covid19/panels/infoPanel.dart';
import 'package:covid19/panels/paisesmasafectados.dart';
import 'package:covid19/panels/panelmundial.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

class Estadisticas extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Estadisticas> {
  Map DatosMundo;

  buscarDatosdelMundo() async {
    http.Response response = await http.get('https://disease.sh/v2/all');
    setState(() {
      DatosMundo = json.decode(response.body);
    });
  }

  Map DatosPeru;

  buscarDatosdePeru() async {
    http.Response response = await http
        .get('https://disease.sh/v3/covid-19/countries/Peru?yesterday=true');
    setState(() {
      DatosPeru = json.decode(response.body);
    });
  }

  List DatosPaises;

  buscarDatosPorPaises() async {
    http.Response response =
    await http.get('https://disease.sh/v2/countries?sort=cases');
    setState(() {
      DatosPaises = json.decode(response.body);
    });
  }

  List DatosRegiones;

  buscarDatosPorRegiones() async {
    http.Response response = await http.get(
        'http://codeunac.dx.am/region.json'); //https://covid19latam.herokuapp.com/pais/Peru
    setState(() {
      DatosRegiones = json.decode(response.body);
    });
  }

  List DatosLima;

  buscarDatosdeLima() async {
    http.Response response =
    await http.get('http://codeunac.dx.am/covidProvincia.json');
    setState(() {
      DatosLima = json.decode(response.body);
    });
  }

  Future buscarDatos() async {
    buscarDatosdelMundo();
    buscarDatosdePeru();
    buscarDatosPorPaises();
    buscarDatosPorRegiones();
    buscarDatosdeLima();
    print('Actualizacion realizada');
  }

  @override
  void initState() {
    buscarDatos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //fecha
    var now = DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              icon: Icon(Theme.of(context).brightness == Brightness.light
                  ? Icons.highlight
                  : Icons.lightbulb_outline),
              onPressed: () {
                DynamicTheme.of(context).setBrightness(
                    Theme.of(context).brightness == Brightness.light
                        ? Brightness.dark
                        : Brightness.light);
              }),
        ],
        centerTitle: false,
        title: Text('Covid-19'),
      ),
      body: RefreshIndicator(
        onRefresh: buscarDatos,
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.timer, color: Colors.green),
                      SizedBox(width: 10),
                      Text(formattedDate, style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),

                // Peru
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'En el Peru',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaginaLima()));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: primaryBlack,
                                borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Lima',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaginaRegiones()));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: primaryBlack,
                                borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Regiones',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
                DatosPeru == null
                    ? CircularProgressIndicator()
                    : PanelPeru(
                  DatosPeru: DatosPeru,
                ),
                // Peru fin

                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'En el Mundo',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaginaPaises()));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: primaryBlack,
                                borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Paises',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
                DatosMundo == null
                    ? CircularProgressIndicator()
                    : PanelMundial(
                  DatosMundo: DatosMundo,
                ),

                //////////////////////////////
                //

                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15),
                  child: Text(
                    'Paises más afectados',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                DatosPaises == null
                    ? Container()
                    : PanelMasAfectados(
                  DatosPaises: DatosPaises,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                      'Juntos en la lucha',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                Center(
                    child: Text(
                      'UNAC 2020',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                SizedBox(
                  height: 18,
                )
              ],
            )),
      ),
    );
  }
}
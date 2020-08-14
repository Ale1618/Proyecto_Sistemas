import 'dart:convert';

import 'package:covid19/core/consts.dart';
import 'package:covid19/datasource.dart';
import 'package:covid19/panels/infoPanel.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        await http.get('https://unac-covid.herokuapp.com/api/v1/provinces');
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
        title: Text('UnacAlert'),
      ),
      body: RefreshIndicator(
        onRefresh: buscarDatos,
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 115,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      topLeft: Radius.circular(0),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    color: Colors.teal,
                  ),
                  child: Text(
                    DataSource.quote,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                    textAlign: TextAlign.justify,
                  ),
                ),
//
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


                Padding(
                  padding:
                  const EdgeInsets.only(
                      left: 15, top: 20, right: 10, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Sintomas del COVID 19',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                /////////////////////////////
                SizedBox(height: 25),
                Container(
                  height: 130,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 16),
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      _buildSintomasItem("images/1.png", "Fiebre"),
                      _buildSintomasItem("images/2.png", "Tos seca"),
                      _buildSintomasItem("images/3.png", "Dolor de cabeza"),
                      _buildSintomasItem("images/4.png", "Agitación"),
                    ],
                  ),
                ),

                Padding(
                  padding:
                  const EdgeInsets.only(
                      left: 15, top: 20, right: 10, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Prevenciones',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 16),
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      _buildPrevencion(
                          "images/a2.png", "  Quedate", "  en casa"),
                      _buildPrevencion("images/a9.png", "   Usar",
                          "   mascarilla\n   cuando salgas"),
                      _buildPrevencion("images/a10.png", "   Lavarse",
                          "   las manos \n   a menudo"),
                      _buildPrevencion(
                          "images/a4.png", "      Cubrise", "      al toser"),
                      _buildPrevencion(
                          "images/a8.png", "Mantener", "la distancia"),
                      _buildPrevencion(
                          "images/a6.png", "Desinfectar", "frecuente-\nmente"),
                    ],
                  ),
                ),

                InfoPanel(),
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

  Widget _buildPrevencion(String path, String text1, String text2) {
    return Column(
      children: <Widget>[
        Container(
          width: 190,
          height: 85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 1,
              ),
            ],
          ),
          padding: EdgeInsets.all(12),
          child: Row(
            children: <Widget>[
              Image.asset(path),
              SizedBox(width: 10),
              RichText(
                text: TextSpan(
                    text: "$text1\n",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: text2,
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ]),
              )
            ],
          ),
          margin: EdgeInsets.only(right: 20),
        ),
        SizedBox(height: 7),
      ],
    );
  }

  Widget _buildSintomasItem(String path, String text) {
    return Column(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            gradient: LinearGradient(
              colors: [
                AppColors.backgroundColor,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 3,
              )
            ],
          ),
          padding: EdgeInsets.only(top: 15),
          child: Image.asset(path),
          margin: EdgeInsets.only(right: 20),
        ),
        SizedBox(height: 7),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}


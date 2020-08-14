import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PanelPeru extends StatelessWidget {
  final Map DatosPeru;

  const PanelPeru({Key key, this.DatosPeru}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat("#,###");
    return Container(
      height: MediaQuery.of(context).size.height * 0.57,
      margin: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
      child:  Column(
        children: <Widget>[
          Flexible(
              child: Row(
                children: <Widget>[
                  StatusPanel(titulo: 'CONFIRMADOS',
                    panelColor: Colors.red[100],
                    textColor: Colors.red,
                    contador: nf.format(DatosPeru['cases']) ?? '',
                  ),
                  StatusPanel(titulo: 'CONFIRMADOS HOY',
                    panelColor: Colors.redAccent[100],
                    textColor: Colors.red[700],
                    contador: nf.format(DatosPeru['todayCases']) ?? '',
                  ),
                ],
              ),
          ),
          Flexible(
              child: Row(
                children: <Widget>[
                  StatusPanel(titulo: 'ACTIVOS',
                    panelColor: Colors.blue[100],
                    textColor: Colors.blue[900],
                    contador: nf.format(DatosPeru['active']) ?? '',
                  ),
                  StatusPanel(titulo: 'CRITICOS',
                    panelColor: Colors.blueAccent[100],
                    textColor: Colors.blueAccent[700],
                    contador: nf.format(DatosPeru['critical']) ?? '',
                  ),
                  StatusPanel(titulo: 'PRUEBAS',
                    panelColor: Colors.deepOrangeAccent[400],
                    textColor: Colors.deepOrangeAccent[800],
                    contador: nf.format(DatosPeru['tests']) ?? '',
                  ),
                ],
              )),
          Flexible(
              child: Row(
                children: <Widget>[
                  StatusPanel(titulo: 'RECUPERADOS',
                    panelColor: Colors.green[100],
                    textColor: Colors.green,
                    contador: nf.format(DatosPeru['recovered']) ?? '',
                  ),
                  StatusPanel(titulo: 'RECUPERADOS HOY',
                    panelColor: Colors.greenAccent[100],
                    textColor: Colors.green[800],
                    contador: nf.format(DatosPeru['todayRecovered']) ?? '',
                  ),
                ],
              )),
          Flexible(
              child: Row(
                children: <Widget>[
                  StatusPanel(titulo: 'DECESOS',
                    panelColor: Colors.blueGrey[400],
                    textColor: Colors.blueGrey[900],
                    contador: nf.format(DatosPeru['deaths']) ?? '',
                  ),
                  StatusPanel(titulo: 'DECESOS HOY',
                    panelColor: Colors.grey[400],
                    textColor: Colors.grey[800],
                    contador: nf.format(DatosPeru['todayDeaths']) ?? '',
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget{

  final Color panelColor;
  final Color textColor;
  final String titulo;
  final String contador;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.titulo, this.contador}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Expanded(
    child: Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            titulo,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: textColor,
            ),
          ),
          Text(
            contador,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
            ),
          ),
        ],
      ),
    ),
    );
  }
}
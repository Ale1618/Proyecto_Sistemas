import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PanelMundial extends StatelessWidget {
  final Map DatosMundo;

  const PanelMundial({Key key, this.DatosMundo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat("#,###");
    return Container(
      margin: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
      child:  GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2),
          children: <Widget>[
            StatusPanel(titulo: 'CONFIRMADOS',
              panelColor: Colors.red[100],
              textColor: Colors.red,
              contador: nf.format(DatosMundo['cases']) ?? '',
            ),
            StatusPanel(titulo: 'ACTIVOS',
              panelColor: Colors.blue[100],
              textColor: Colors.blue[900],
              contador: nf.format(DatosMundo['active']) ?? '',
            ),
            StatusPanel(titulo: 'RECUPERADOS',
              panelColor: Colors.green[100],
              textColor: Colors.green,
              contador: nf.format(DatosMundo['recovered']) ?? '',
            ),
            StatusPanel(titulo: 'DECESOS',
              panelColor: Colors.grey[400],
              textColor: Colors.grey[900],
              contador: nf.format(DatosMundo['deaths']) ?? '',
            ),
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

    return Container(
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
                fontWeight: FontWeight.bold,
                fontSize: 16, color: textColor
            ),
          ),
          Text(
            contador,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor
            ),
          )
        ],
      ),
    );
}
}
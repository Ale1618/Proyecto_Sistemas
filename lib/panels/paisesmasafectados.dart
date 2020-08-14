import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PanelMasAfectados extends StatelessWidget {

  final List DatosPaises;

  const PanelMasAfectados({Key key, this.DatosPaises}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat("#,###");
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index) {
        return Container(
          padding: const EdgeInsets.only(top: 0, left: 15),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                children: <Widget>[
                  Image.network(DatosPaises[index]['countryInfo']['flag'],height: 25,),
                  SizedBox(width: 10,),
                  Text(DatosPaises[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                  Text('Muertes: '+ nf.format(DatosPaises[index]['deaths']),style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                ],
              ),
            );
      },
      itemCount: 5,),
    );
  }
}

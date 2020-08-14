import 'package:covid19/datasource.dart';
import 'package:covid19/paginas/preguntasrespuestas.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PreguntasyRespuestas()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Preguntas Frecuentes',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 18),),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch('https://covid19responsefund.org/');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Donar',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 18),),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch('https://especiales.elcomercio.pe/mas-mitos-sobre-el-coronavirus-amp-ecvisual-ecpm');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Mitos',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 18),),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
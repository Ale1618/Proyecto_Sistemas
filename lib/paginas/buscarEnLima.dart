import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:covid19/datasource.dart';


class BuscarEnLima extends SearchDelegate{

  final List LimaLista;

  BuscarEnLima(this.LimaLista);


  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        primaryColor: primaryBlack,
        brightness: DynamicTheme.of(context).brightness
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query='';

      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
      Navigator.pop(context);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
    final suggestionList
    =
    query.isEmpty?
    LimaLista:
    LimaLista.where((element) => element['titulo'].toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index){
          return Card(
            child: Container(
              height: 130,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 140,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          suggestionList[index]['titulo'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 30), // <- posible error
                        child: Column(
                          children: <Widget>[
                            Text(
                              'CONFIRMADOS:' +
                                  suggestionList[index]['activos'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              'RECUPERADOS:' +
                                  suggestionList[index]['recuperado'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            Text(
                              'DECESOS:' +
                                  suggestionList[index]['muertos'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:  Theme.of(context).brightness==Brightness.dark?Colors.grey[100]:Colors.grey[900]),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        });
  }

}
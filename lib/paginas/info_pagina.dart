import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaginaInfo extends StatelessWidget {
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se puede iniciar $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Acerca'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text('Novel Covid API'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  _launchURL('https://disease.sh/');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('UNAC'),
                subtitle: Text('2020'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  _launchURL('https://www.unac.edu.pe/');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
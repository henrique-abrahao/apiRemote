import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trampoely3/screens/details_screen.dart';

import '../api.dart';

class ListProdutos extends StatefulWidget {
  @override
  _ListProdutosState createState() => _ListProdutosState();
}

class _ListProdutosState extends State<ListProdutos> {

  Utf8Codec UTF8 = const Utf8Codec();

  Future<List> _getProd() async {
    http.Response response;


    response = await http
        .get('http://sistemaagely.com.br/getArquivo?file=produtos.json');
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Categories",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder(
                  future: _getProd(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return Container(
                          child: Center(
                            child: CircularProgressIndicator(
                              valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                              strokeWidth: 3,
                            ),
                          ),
                        );
                      default:
                        if (snapshot.hasError){
                          print(snapshot.error);
                          return Center();
                        }
                        else
                          return _gerGrid(context, snapshot);
                    }
                  }),
            )
          ],
        ));
  }

  Widget _gerGrid(BuildContext context, AsyncSnapshot snapshot) {

    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ListTile(
              subtitle: Text('${snapshot.data[index]["marca"]}'),
              title: Text('${snapshot.data[index]['descricao']}'),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(snapshot.data[index])));
            },
          );
        });
  }

}

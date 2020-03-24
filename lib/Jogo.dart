import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget{
  @override
 _JogoState createState() => _JogoState();
}


class _JogoState extends State<Jogo>{

  var _imagemApp = AssetImage('images/padrao.png');
  String _mensagem = "";

  opcaoSelecionada(String escolhaUsuario){

    var opcoes = ["pedra","papel","tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch(escolhaApp){
      case "pedra" :
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel" :
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura" :
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if(
    (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ){
      setState(() {
        this._mensagem = "Parabéns!!! Você ganhou :)";
      });
      //App Ganhador
    }else if(
    (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")
    ){
      setState(() {
        this._mensagem = "Você perdeu :(";
      });
    }else{
      setState(() {
        this._mensagem = "Empatamos ;)";
      });
    }

    print(_mensagem);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
      title: Text("Jokenpo Flutter"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: this._imagemApp,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha uma opcao abaixo",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              GestureDetector(
                onTap: () => opcaoSelecionada("pedra"),
                child: Image.asset('images/pedra.png', height: 95,),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada("papel"),
                child: Image.asset('images/papel.png', height: 95,),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada("tesoura"),
                child: Image.asset('images/tesoura.png', height: 95,),
              ),
            ],

          ),

          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Teste',
        child: Text('JorRaf'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}
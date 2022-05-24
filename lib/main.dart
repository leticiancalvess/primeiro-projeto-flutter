import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeStateful()));
}

class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  var _imagemPadrao = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    switch (escolhaApp) {
      case 'pedra':
        setState(() {
          this._imagemPadrao = AssetImage("images/pedra.png");
        });
        break;
      case 'papel':
        setState(() {
          this._imagemPadrao = AssetImage("images/papel.png");
        });
        break;
      case 'tesoura':
        setState(() {
          this._imagemPadrao = AssetImage("images/tesoura.png");
        });
    }
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Parabéns!!! Você ganhou :)";
      });
      //App Ganhador
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        this._mensagem = "Você perdeu :(";
      });
    } else {
      setState(() {
        this._mensagem = "Empatamos ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('JokenPo'), backgroundColor: Colors.blue),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text("Escolha do App")),
            Image(image: this._imagemPadrao),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(this._mensagem),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                    onTap: () => _opcaoSelecionada("pedra"),
                    child: Image.asset('images/pedra.png', height: 100)),
                GestureDetector(
                    onTap: () => _opcaoSelecionada("papel"),
                    child: Image.asset('images/papel.png', height: 100)),
                GestureDetector(
                    onTap: () => _opcaoSelecionada("papel"),
                    child: Image.asset('images/tesoura.png', height: 100))
              ],
            )
          ],
        ));
  }
}

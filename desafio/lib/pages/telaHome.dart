  import 'package:desafio/pages/telaCadastro.dart';
import 'package:desafio/pages/telalogin.dart';
import 'package:flutter/material.dart';

  class TelaHome extends StatefulWidget {
    @override
    State<TelaHome> createState() => _TelaHomeState();
  }

  class _TelaHomeState extends State<TelaHome> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'HOME',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 4),
          ),
          backgroundColor: Colors.black38,
          centerTitle: true,
        ),
        body:Center( 
          child: 
          Padding(
          padding: EdgeInsets.all(16),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Bem vindo(a)! Tela Inicial",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 22, 22, 22),
              ),
            ),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaLogin()),
              );
              },
              child: const Text('Entrar'),
            ),
            Padding(padding: EdgeInsets.all(15)),
             ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaCadastro()),
              );
              },
              child: const Text('Criar Conta'),
            ),
            ]
        )]),
        ),
        ),
      );
    }
  }

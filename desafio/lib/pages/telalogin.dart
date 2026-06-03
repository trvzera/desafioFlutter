import 'package:desafio/pages/telaInicial.dart';
import 'package:flutter/material.dart';

  class TelaLogin extends StatefulWidget {
    @override
    State<TelaLogin> createState() => _TelaLoginState();
  }

  class _TelaLoginState extends State<TelaLogin> {
    final TextEditingController _meuController = TextEditingController();
      final TextEditingController senhaController = TextEditingController();

    String _mensagem = "Digite o seu login:";

    validarEmail() {
      String email = _meuController.text;
      String senha = senhaController.text;
      final RegExp emailRegExp = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );
      setState(() {
        if (email.isEmpty) {
          _mensagem = 'O e-mail não pode estar vazio.';
        } else if (!emailRegExp.hasMatch(email)) {
          _mensagem = 'Formato de e-mail inválido.';
        } else {
          if (senha.isEmpty){
              _mensagem = "Email Valido! Mas Digite uma senha!";
          }
          else {
            _mensagem = "Válido!";
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => (TelaInicial())),
              );
          }
          
        }
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'LOGIN',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 4),
          ),
          backgroundColor: Colors.black38,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 22, 22, 22),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _meuController,
              decoration: const InputDecoration(
                labelText: 'Digite seu email',
                hintText: 'Ex: seuemail@gmail.com',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email)
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Digite sua senha',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock)

              ),

            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  validarEmail();
                });
              },
              child: const Text('Entrar'),
            ),
          ]),
        ),
      );
    }
  }

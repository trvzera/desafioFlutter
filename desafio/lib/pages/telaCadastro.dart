import 'package:desafio/pages/telaInicial.dart';
import 'package:flutter/material.dart';

  class TelaCadastro extends StatefulWidget {
    @override
    State<TelaCadastro> createState() => _TelaCadastroState();
  }

  class _TelaCadastroState extends State<TelaCadastro> {
    final TextEditingController _meuController = TextEditingController();
    final TextEditingController senhaController = TextEditingController();
    final TextEditingController senhaController2 = TextEditingController();
    final TextEditingController nomeController = TextEditingController();


    String _mensagem = "Vamos criar sua conta!";

    validarEmail() {
      String email = _meuController.text;
      String senha = senhaController.text;
      String senha2 = senhaController2.text;
      String nome = nomeController.text;

      final RegExp emailRegExp = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );
      setState(() {
        if(nome.isEmpty){
          _mensagem = "O nome não pode ser vazio!";
        }
        else{
          if (email.isEmpty) {
            _mensagem = 'O e-mail não pode estar vazio.';
          } else if (!emailRegExp.hasMatch(email)) {
            _mensagem = 'Formato de e-mail inválido.';
          } else {
            if (senha.isEmpty){
                _mensagem = "Email Valido! Mas Digite uma senha!";
            }
            else if (senha.length < 6) {
              _mensagem = "A senha deve ter pelo menos 6 caracteres";
            }
            else {
              _mensagem = "Válido!";
              if (senha != senha2){
                _mensagem = "As senhas devem ser iguais!";
              }
              else{
                _mensagem = "Cadastro realizado com sucesso!";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaInicial()),
                );
              }
            }
          }
        }
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'CADASTRO',
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
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Digite seu nome',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_2)
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
            TextField(
              controller: senhaController2,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirme sua senha',
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
              child: const Text('Criar'),
            ),
          ]),
        ),
      );
    }
  }

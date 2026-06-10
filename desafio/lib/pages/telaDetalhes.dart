import 'package:flutter/material.dart';
import 'telaAnimatedContainer.dart';
import 'telaPageRoute.dart';

class TelaDetalhes extends StatelessWidget {
  const TelaDetalhes({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animações"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Icon(
                Icons.school,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                "Animação implícita e explícita",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "Escolha um tipo de animação",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const TelaAnimatedContainer();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.screenshot_monitor),
                  label: const Text("Animated Container")),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const TelaPageRoute();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.animation),
                  label: const Text("Animated Container"))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TelaAnimatedContainer extends StatefulWidget {
  const TelaAnimatedContainer({super.key});

  @override
  State<TelaAnimatedContainer> createState() => _TelaAnimatedContainerState();
}

class _TelaAnimatedContainerState extends State<TelaAnimatedContainer> {
  bool expandido = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Animated Container",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Clique no card para animar",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      expandido = !expandido;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: expandido ? 300 : 130,
                    height: expandido ? 300 : 130,
                    decoration: BoxDecoration(
                        color: expandido ? Colors.blue : Colors.orange,
                        borderRadius:
                            BorderRadius.circular(expandido ? 30 : 10)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

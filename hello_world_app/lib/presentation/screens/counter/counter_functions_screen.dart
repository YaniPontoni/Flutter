import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Counter Functions")),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$clickCounter",
                style:
                    const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
              ),
              Text(
                "Click${clickCounter == 1 ? "" : "s"}", // Uso un ternario para concatenar el texto segun lo esperado por la condicion
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.refresh_rounded,
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              icon: Icons.exposure_minus_1_outlined,
              onPressed: () {
                setState(() {
                  if (clickCounter == 0) return;
                  clickCounter--;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              icon: Icons.plus_one,
              onPressed: () {
                setState(() {
                  clickCounter++;
                });
              },
            ),
          ],
        ));
  }
}

// FloatingActionButton personalizado para ser reutilizado dentro de la aplicacion

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: "Presioname", // Este atributo me permite colocar un texto que se mostrara cuando el boton se mantenga presionado
      shape: const StadiumBorder(), // Este atributo me permite darle cierta forma geometrica al boton
      onPressed: onPressed, // Este atributo sirve para desencadenar un evento cuando se presione el boton
      foregroundColor: Colors.purple, // Este atributo cambia el color del contenido del boton
      backgroundColor: Colors.amber, // Este atributo cambia el color del fondo del boton
      focusColor: Colors.red,
      hoverColor: Colors.blue,
      elevation: 10, // Este atributo controla la sombra del boton
      
      child: Icon(icon),
    );
  }
}

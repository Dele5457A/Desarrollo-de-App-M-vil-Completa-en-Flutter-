// ============================================================
// Archivo: lib/main.dart
// Tema: Catálogo de Videojuegos (mabalinmo a sukatan ti tema)
// ============================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo TI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D47A1)),
        useMaterial3: true,
      ),
      home: const PantallaPrincipal(),
    );
  }
}

// ---------------------------------------------------------------------
// MODELO: Modelo para los elementos de la lista.
// ---------------------------------------------------------------------
class Elemento {
  final String nombre;
  final IconData icono;
  final Color color;
  final String descripcion;

  const Elemento({
    required this.nombre,
    required this.icono,
    required this.color,
    required this.descripcion,
  });
}

// ---------------------------------------------------------------------
// ARREGLO: Lista con los elementos del nuevo tema.
// ---------------------------------------------------------------------
const List<Elemento> elementos = [
  Elemento(
    nombre: 'Juegos de Acción',
    icono: Icons.sports_esports,
    color: Color(0xFFE53935),
    descripcion:
        'Experiencias llenas de adrenalina, combates rápidos y desafíos '
        'de reflejos para jugadores que buscan emoción constante.',
  ),
  Elemento(
    nombre: 'Estrategia y Rol',
    icono: Icons.casino,
    color: Color(0xFF8E24AA),
    descripcion:
        'Toma de decisiones tácticas, desarrollo de personajes y mundos '
        'extensos llenos de historias e interacciones complejas.',
  ),
  Elemento(
    nombre: 'Aventura y Exploración',
    icono: Icons.explore,
    color: Color(0xFF43A047),
    descripcion:
        'Descubre nuevos mundos, resuelve acertijos y completa misiones '
        'en entornos detallados y envolventes.',
  ),
  Elemento(
    nombre: 'Deportes y Carreras',
    icono: Icons.directions_car,
    color: Color(0xFFFB8C00),
    descripcion:
        'Simulación de competencias deportivas reales y carretas a alta '
        'velocidad con físicas avanzadas.',
  ),
  Elemento(
    nombre: 'Juegos de Puzle',
    icono: Icons.extension,
    color: Color(0xFF00ACC1),
    descripcion:
        'Retos mentales, lógica y acertijos diseñados para poner a prueba '
        'tu capacidad de resolución de problemas.',
  ),
];

// ---------------------------------------------------------------------
// PANTALLA 1: PRINCIPAL (Rejilla)
// ---------------------------------------------------------------------
class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Videojuegos'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: elementos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (BuildContext context, int indice) {
          final Elemento elemento = elementos[indice];
          return _TarjetaElemento(elemento: elemento);
        },
      ),
    );
  }
}

class _TarjetaElemento extends StatelessWidget {
  final Elemento elemento;

  const _TarjetaElemento({required this.elemento});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext contexto) =>
                  PantallaContenido(elemento: elemento),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: elemento.color,
                child: Icon(elemento.icono, color: Colors.white, size: 30),
              ),
              const SizedBox(height: 12),
              Text(
                elemento.nombre,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------
// PANTALLA 2: CONTENIDO (Detalle)
// ---------------------------------------------------------------------
class PantallaContenido extends StatelessWidget {
  final Elemento elemento;

  const PantallaContenido({super.key, required this.elemento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contenido')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            CircleAvatar(
              radius: 60,
              backgroundColor: elemento.color,
              child: Icon(elemento.icono, color: Colors.white, size: 60),
            ),
            const SizedBox(height: 20),
            Text(
              elemento.nombre,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              elemento.descripcion,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Regresar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

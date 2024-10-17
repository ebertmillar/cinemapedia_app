import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  

  Stream<String> getLoadingMessages(){
    
    final List<String> messages =[
    'Cargando peliculas',
    'Cargando lista de peliculas en cartelera',
    'Cargando peliculas populares',
    'Cargando proximos estrenos',
    'Cargando lo mas recomendado',
    'Ya casi esta listo',
    'Esto esta tardando mas de lo normal',
    ];

    return Stream.periodic(const Duration(milliseconds: 1400), (step){
      return messages[step]; //step paso -posicion indice
    }).take(messages.length); //el take cancela el periodic 
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),

          StreamBuilder(
            stream: getLoadingMessages(), 
            builder: (context, snapshot) {
              if( !snapshot.hasData ) return const Text('cargando..');
              return Text(snapshot.data!);
            },
          ),

        ],
      ),
    );
  }
}
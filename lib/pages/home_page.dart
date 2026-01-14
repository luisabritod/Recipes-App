import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitas_app/pages/pages.dart';
import 'package:receitas_app/providers/providers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ReceitasProvider>(context, listen: false).buscarReceitas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipes"),
      ),
      body: Consumer<ReceitasProvider>(
        builder: (context, receitas, _) {
          if (receitas.carregando) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (receitas.receitas.isEmpty) {
            return const Center(
              child: Text('No recipes found'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: receitas.receitas.length,
            itemBuilder: (context, index) {
              final receita = receitas.receitas[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(receitaId: receita.id),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.network(
                        receita.urlImagem,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 200,
                            color: Colors.grey[300],
                            child: const Icon(Icons.error, size: 50),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          receita.nome,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

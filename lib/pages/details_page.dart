import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitas_app/core/theme/app_colors.dart';
import 'package:receitas_app/providers/providers.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.receitaId});

  final String receitaId;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ReceitasProvider>(
        context,
        listen: false,
      ).buscarDetalhesDaReceita(widget.receitaId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Details"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.secondary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Consumer<ReceitasProvider>(
        builder: (context, provider, _) {
          if (provider.carregando) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (provider.receitaDetalhada == null) {
            return const Center(
              child: Text("No recipe found."),
            );
          }

          final receita = provider.receitaDetalhada!;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  receita.urlImagem,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 250,
                      color: Colors.grey[300],
                      child: const Icon(Icons.error, size: 50),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    receita.nome,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ingredients:',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontSize: 20,
                            ),
                      ),
                      const SizedBox(height: 12),
                      ...receita.ingredientes.map(
                        (ingrediente) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('• ', style: TextStyle(fontSize: 16)),
                              Expanded(
                                child: Text(
                                  ingrediente,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Instructions:',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontSize: 20,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        receita.instrucoes,
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}

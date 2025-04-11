import 'package:flutter/material.dart';
import '../../models/romaneio.dart';
import '../../services/api_romaneio.dart';

class ListaRomaneioPage extends StatefulWidget {
  const ListaRomaneioPage({Key? key}) : super(key: key);

  @override
  _ListaRomaneioPageState createState() => _ListaRomaneioPageState();
}

class _ListaRomaneioPageState extends State<ListaRomaneioPage> {
  final ApiTicket apiTicket = ApiTicket();
  List<Romaneio> tickets = [];

  @override
  void initState() {
    super.initState();
    _carregarTickets();
  }

  void _carregarTickets() async {
    try {
      List<Romaneio> resultado = await apiTicket.fetchTickets();
      setState(() {
        tickets = resultado;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao carregar tickets')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Romaneios'),centerTitle: true,),
      body: tickets.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final t = tickets[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Status: ${t.status}', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Data: ${t.createdAt}'),
                        Text('Ticket: ${t.numeroTicket}'),
                        Text('Sacas: ${t.sacas ?? '-'}'),
                        Text('Umidade (%): ${t.umidadeTeor?.toStringAsFixed(2) ?? '-'}'),
                        Text('Avariado (%): ${t.avariadoTeor?.toStringAsFixed(2) ?? '-'}'),
                        Text('Impureza (%): ${t.impurezaTeor?.toStringAsFixed(2) ?? '-'}'),
                        Text('Desconto total: ${t.descontoTotal?.toStringAsFixed(2) ?? '-'}'),
                        Text('Talhão: ${t.talhao}'),
                        Text('Usuário: ${t.user}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../models/romaneio.dart';
import '../../services/api_romaneio.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import '../../utils/utf_correction.dart';

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

    resultado.sort((a, b) {
      DateTime dataA = DateTime.parse(a.createdAt);
      DateTime dataB = DateTime.parse(b.createdAt);
      return dataB.compareTo(dataA); // mais recente primeiro
    });

    setState(() {
      tickets = resultado;
    });
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Erro ao carregar tickets')),
    );
  }
}


  Color? getCardColor(String status) {
    switch (status) {
      case 'Primeira pesagem':
        return Colors.red[200];
      case 'Classificação':
        return Colors.orange[200];
      case 'Segunda pesagem':
        return Colors.yellow[200];
      case 'Concluído':
        return Colors.green[200];
      default:
        return Colors.grey[200];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Romaneios'),
        centerTitle: true,
      ),
      body: tickets.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final t = tickets[index];
                final cardColor = getCardColor(t.status);


                return Card(
                  color: cardColor,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status: ${t.status}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Data: ${DateFormat("dd/MM/yyyy - HH:mm").format(DateTime.parse(t.createdAt))}',),
                        Text('Ticket: ${t.numeroTicket}'),
                        Text('Sacas: ${t.sacas ?? '-'}'),
                        Text('Umidade (%): ${t.umidadeTeor?.toStringAsFixed(2) ?? '-'}'),
                        Text('Avariado (%): ${t.avariadoTeor?.toStringAsFixed(2) ?? '-'}'),
                        Text('Impureza (%): ${t.impurezaTeor?.toStringAsFixed(2) ?? '-'}'),
                        Text('Desconto total: ${t.descontoTotal?.toStringAsFixed(2) ?? '-'}'),
                        Text('Talhão: ${t.talhao?.nome ?? '-'}'),
                        Text('Usuário: ${t.user?.username ?? '-'}'),
                        Text('Tipo: ${t.entrada ? 'Entrada' : 'Saída'}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

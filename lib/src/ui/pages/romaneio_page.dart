import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../models/romaneio.dart';
import '../../services/api_romaneio.dart';
import 'package:intl/intl.dart';

class ListaRomaneioPage extends StatefulWidget {
  const ListaRomaneioPage({Key? key}) : super(key: key);

  @override
  _ListaRomaneioPageState createState() => _ListaRomaneioPageState();
}

class _ListaRomaneioPageState extends State<ListaRomaneioPage> {
  final ApiTicket apiTicket = ApiTicket();

  static const _pageSize = 5;
  final PagingController<int, Romaneio> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((offset) {
      _fetchPage(offset);
    });
  }

  Future<void> _fetchPage(int offset) async {
    try {
      final response =
          await apiTicket.fetchPaginatedTickets(offset: offset, limit: _pageSize);

      final isLastPage = response.next == null;
      final newItems = response.results;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextOffset = offset + _pageSize;
        _pagingController.appendPage(newItems, nextOffset);
      }
    } catch (error) {
      _pagingController.error = error;
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
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Romaneios'),
        centerTitle: true,
      ),
      body: PagedListView<int, Romaneio>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Romaneio>(
          itemBuilder: (context, t, index) {
            final cardColor = getCardColor(t.status);

            return Card(
              color: cardColor,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Status: ${t.status}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Data: ${DateFormat("dd/MM/yyyy - HH:mm").format(DateTime.parse(t.createdAt))}'),
                    Text('Ticket: ${t.numeroTicket}'),
                    Text('Sacas: ${t.sacas != null ? t.sacas!.toStringAsFixed(2) : '-'}'),
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
      ),
    );
  }
}

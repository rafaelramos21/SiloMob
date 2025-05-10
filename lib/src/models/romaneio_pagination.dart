import 'romaneio.dart';


class PaginatedRomaneio {
  final int count;
  final String? next;
  final String? previous;
  final List<Romaneio> results;

  PaginatedRomaneio({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PaginatedRomaneio.fromJson(Map<String, dynamic> json) {
    return PaginatedRomaneio(
      count: json['count'] ?? 0,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List)
          .map((item) => Romaneio.fromJson(item))
          .toList(),
    );
  }
}


import 'dart:convert';

class PagingModel<T> {
  final int? currentPage;
  final List<T>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<dynamic>? links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  PagingModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory PagingModel.fromJson(
    String str,
    T Function(Map<String, dynamic>) fromMapItem,
  ) =>
      PagingModel.fromMap(json.decode(str), fromMapItem);

  factory PagingModel.fromMap(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromMapItem,
  ) =>
      PagingModel<T>(
        currentPage: json['current_page'],
        data: json['data'] == null
            ? []
            : List<T>.from(
                json['data'].map((x) => fromMapItem(x as Map<String, dynamic>)),
              ),
        firstPageUrl: json['first_page_url'],
        from: json['from'],
        lastPage: json['last_page'],
        lastPageUrl: json['last_page_url'],
        links: json['links'] == null
            ? []
            : List<dynamic>.from(json['links'].map((x) => x)),
        nextPageUrl: json['next_page_url'],
        path: json['path'],
        perPage: json['per_page'],
        prevPageUrl: json['prev_page_url'],
        to: json['to'],
        total: json['total'],
      );
}
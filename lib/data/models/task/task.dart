import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String uid;
  final String title;
  final String status;
  final double index;
  final DateTime dateTimeCreated;
  final DateTime dateTimeLastUpdated;

  const Task({
    required this.uid,
    required this.title,
    required this.status,
    required this.index,
    required this.dateTimeCreated,
    required this.dateTimeLastUpdated,
  });
  @override
  String toString() => 'Task{ uid: $uid, title: $title,status: $status, index: $index, '
      'dateTimeCreated: $dateTimeCreated, dateTimeLastUpdated: $dateTimeLastUpdated,}';

  Task copyWith({
    String? uid,
    String? title,
    String? status,
    double? index,
    DateTime? dateTimeCreated,
    DateTime? dateTimeLastUpdated,
  }) =>
      Task(
        uid: uid ?? this.uid,
        title: title ?? this.title,
        status: status ?? this.status,
        index: index ?? this.index,
        dateTimeCreated: dateTimeCreated ?? this.dateTimeCreated,
        dateTimeLastUpdated: dateTimeLastUpdated ?? this.dateTimeLastUpdated,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'title': title,
        'status': status,
        'index': index,
        'dateTimeCreated': dateTimeCreated,
        'dateTimeLastUpdated': dateTimeLastUpdated,
      };

  Map<String, dynamic> toJsonEncode() => {
        'uid': uid,
        'title': title,
        'status': status,
        'index': index,
        'dateTimeCreated': dateTimeCreated.toIso8601String(),
        'dateTimeLastUpdated': dateTimeLastUpdated.toIso8601String(),
      };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        uid: json['uid'] as String? ?? '',
        title: json['title'] as String? ?? '',
        status: json['status'] as String? ?? '',
        index: json['index'] as double? ?? 0,
        dateTimeCreated: json['dateTimeCreated'] as DateTime? ?? DateTime.now(),
        dateTimeLastUpdated: json['dateTimeLastUpdated'] as DateTime? ?? DateTime.now(),
      );

  factory Task.fromJsonEncoded(Map<String, dynamic> json) => Task(
        uid: json['uid'] as String? ?? '',
        title: json['title'] as String? ?? '',
        status: json['status'] as String? ?? '',
        index: json['index'] as double? ?? 0,
        dateTimeCreated: (json['dateTimeCreated'] is String)
            ? DateTime.tryParse(json['dateTimeCreated']) ?? DateTime.now()
            : DateTime.now(),
        dateTimeLastUpdated: (json['dateTimeLastUpdated'] is String)
            ? DateTime.tryParse(json['dateTimeLastUpdated']) ?? DateTime.now()
            : DateTime.now(),
      );

  @override
  List<Object?> get props => [
        uid,
        title,
        status,
        index,
        dateTimeCreated,
        dateTimeLastUpdated,
      ];
}

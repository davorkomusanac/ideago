import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String uid;
  final String title;
  final String status;
  final DateTime dateTimeCreated;
  final DateTime dateTimeLastUpdated;

  const Task({
    required this.uid,
    required this.title,
    required this.status,
    required this.dateTimeCreated,
    required this.dateTimeLastUpdated,
  });
  @override
  String toString() => 'Task{ uid: $uid, title: $title,status: $status, '
      'dateTimeCreated: $dateTimeCreated, dateTimeLastUpdated: $dateTimeLastUpdated,}';

  Task copyWith({
    String? uid,
    String? title,
    String? status,
    DateTime? dateTimeCreated,
    DateTime? dateTimeLastUpdated,
  }) =>
      Task(
        uid: uid ?? this.uid,
        title: title ?? this.title,
        status: status ?? this.status,
        dateTimeCreated: dateTimeCreated ?? this.dateTimeCreated,
        dateTimeLastUpdated: dateTimeLastUpdated ?? this.dateTimeLastUpdated,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'title': title,
        'status': status,
        'dateTimeCreated': dateTimeCreated,
        'dateTimeLastUpdated': dateTimeLastUpdated,
      };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        uid: json['uid'] as String? ?? '',
        title: json['title'] as String? ?? '',
        status: json['status'] as String? ?? '',
        dateTimeCreated: json['dateTimeCreated'] as DateTime? ?? DateTime.now(),
        dateTimeLastUpdated: json['dateTimeLastUpdated'] as DateTime? ?? DateTime.now(),
      );

  @override
  List<Object?> get props => [
        uid,
        title,
        status,
        dateTimeCreated,
        dateTimeLastUpdated,
      ];
}

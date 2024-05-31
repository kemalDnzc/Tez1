import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String comment;
  final DateTime timestamp;
  final String userEmail;

  Comment ({
    required this.comment,
    required this.timestamp,
    required this.userEmail,
  });

  factory Comment.fromMap(Map<String, dynamic> data) {
    return Comment(
      comment: data['comment'],
      timestamp: (data['timestamp'] as Timestamp).toDate(),
      userEmail: data['userEmail'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'comment': comment,
      'timestamp': timestamp,
      'userEmail': userEmail,
    };
  }
}
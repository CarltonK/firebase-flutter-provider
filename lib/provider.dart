import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'issue.dart';

class IssueProvider extends ChangeNotifier {
  final CollectionReference _issueCollection =
      FirebaseFirestore.instance.collection('issues');
  List<Issue> _issues = [];
  bool _isLoading = false;

  List<Issue> get issues => _issues;
  bool get isLoading => _isLoading;

  Future<void> fetchIssues() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Fetch the issues from Firestore
      final querySnapshot =
          await _issueCollection.orderBy('createdAt', descending: true).get();

      // Convert the Firestore documents to Issue objects
      _issues = querySnapshot.docs.map((doc) {
        final data = doc.data() as Issue;
        return Issue(
          id: doc.id,
          title: data.title,
          description: data.description,
        );
      }).toList();
    } catch (error) {
      debugPrint('Error fetching issues: $error');
    }

    _isLoading = false;
    notifyListeners();
  }
}

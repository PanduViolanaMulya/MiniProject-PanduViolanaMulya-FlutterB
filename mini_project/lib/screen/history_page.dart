import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mini_project/model/result_db.dart';
import 'package:mini_project/screen/history_page_builder.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Quiz History'),
      ),
      body: buildHistoryScreen(),
    );
  }

  Widget buildHistoryScreen() {
    return Consumer<ResultDb>(
      builder: (context, manager, child) {
        return HistoryPageBuilder(manager: manager);
      },
    );
  }
}

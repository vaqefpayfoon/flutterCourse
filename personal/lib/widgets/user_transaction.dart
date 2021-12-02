import 'package:flutter/material.dart';
import 'package:personal/models/transaction.dart';
import 'package:personal/widgets/new_transaction.dart';
import 'package:personal/widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

final List<Transaction> _userTransactions = [
  Transaction(id: '1', title: 'Shoes', amount: 66.99, date: DateTime.now()),
  Transaction(id: '2', title: 'Gloves', amount: 14.30, date: DateTime.now())
];

class _UserTransactionsState extends State<UserTransactions> {
  void _addNewTransaction(String txtTitle, double txtAmount) {
    final newTx = Transaction(
        id: 'newId', title: txtTitle, amount: txtAmount, date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions)
      ],
    );
  }
}

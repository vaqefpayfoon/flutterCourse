import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  late TextEditingController titleController = TextEditingController();

  late TextEditingController amountController = TextEditingController();

  void submit_data() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    widget.addTx(title, amount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            onChanged: (val) => titleController.text = val,
            onSubmitted: (_) => submit_data(),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            onChanged: (val) => amountController.text = val,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onSubmitted: (_) => submit_data(),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  onPressed: submit_data,
                  child: const Text('Add Transaction'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlue),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 17)),
                      alignment: Alignment.centerRight)))
        ],
      ),
    ));
  }
}

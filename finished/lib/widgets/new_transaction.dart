import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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

  late DateTime _selectedDate = DateTime.now();

  void _submit_data() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    widget.addTx(title, amount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime(2023, 12, 19))
        .then((value) => {
              setState(() {
                _selectedDate = value as DateTime;
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              onChanged: (val) => titleController.text = val,
              onSubmitted: (_) => _submit_data(),
            ),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            onChanged: (val) => amountController.text = val,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onSubmitted: (_) => _submit_data(),
          ),
          Row(
            children: [
              Container(
                child: Text(_selectedDate == null
                    ? 'No Date Chosen'
                    : DateFormat.yMMMd().format(_selectedDate)),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () {
                      _presentDatePicker();
                    },
                    child: Text('choose date'),
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 17)),
                    )),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.only(top: 12),
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  onPressed: _submit_data,
                  child: const Text('Add Transaction'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlue),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 17)),
                    alignment: Alignment.centerRight,
                  )))
        ],
      ),
    ));
  }
}

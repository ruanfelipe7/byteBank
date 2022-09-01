import 'package:flutter/material.dart';

import '../../components/text_input.dart';
import '../../models/transfer.dart';

class TransferForm extends StatefulWidget {
  TransferForm({Key? key}) : super(key: key);

  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  @override
  State<TransferForm> createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando Transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextInput(
              controller: widget.accountNumberController,
              labelText: 'Número da conta',
              hintText: '0000',
            ),
            TextInput(
              controller: widget.valueController,
              labelText: 'Valor',
              hintText: '0.00',
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _createTransfer(context),
              child: const Text('Confirmar'),
            )
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int? accountNumber =
        int.tryParse(widget.accountNumberController.text);
    final double? value = double.tryParse(widget.valueController.text);
    if (accountNumber != null && value != null) {
      final newTransfer = Transfer(value, accountNumber);
      Navigator.pop(context, newTransfer);
    }
  }
}

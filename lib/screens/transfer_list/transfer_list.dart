import 'package:flutter/material.dart';

import '../../models/transfer.dart';
import '../transfer_form/transfer_form.dart';
import 'components/transfer_item.dart';

class TransferList extends StatefulWidget {
  TransferList({Key? key}) : super(key: key);

  final List<Transfer> transferList = [];

  @override
  State<TransferList> createState() => _TransferListState();
}

class _TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget.transferList.length,
        itemBuilder: (context, index) {
          final transfer = widget.transferList[index];
          return TransferItem(
            transfer: transfer,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          })).then((value) {
            if (value != null) {
              setState(() {
                widget.transferList.add(value);
              });
            }
          });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

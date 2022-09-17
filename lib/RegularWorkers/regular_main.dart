import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegularWorker extends StatefulWidget {
  const RegularWorker({Key? key}) : super(key: key);

  @override
  State<RegularWorker> createState() => _RegularWorkerState();
}

class _RegularWorkerState extends State<RegularWorker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Worker")),
    );
  }
}

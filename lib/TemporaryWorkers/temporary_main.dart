import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TempWorker extends StatefulWidget {
  const TempWorker({Key? key}) : super(key: key);

  @override
  State<TempWorker> createState() => _TempWorkerState();
}

class _TempWorkerState extends State<TempWorker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Temp Worker")),
    );
  }
}

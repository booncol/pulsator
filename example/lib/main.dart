import 'package:flutter/material.dart';
import 'package:pulsator/pulsator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pulsator example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 4;
  int _duration = 3;
  int _repeatCount = 0;

  void _handleCountChanged(double value) =>
      setState(() => _count = value.toInt());

  void _handleDurationChanged(double value) =>
      setState(() => _duration = value.toInt());

  void _handleRepeatCountChanged(double value) =>
      setState(() => _repeatCount = value.toInt());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pulsator')),
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Pulsator(
                    style: const PulseStyle(color: Colors.red),
                    count: _count,
                    duration: Duration(seconds: _duration),
                    repeat: _repeatCount,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/android_phone.png',
                      width: 128,
                      height: 128,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: _Controls(
                count: _count,
                duration: _duration,
                repeatCount: _repeatCount,
                onCountChanged: _handleCountChanged,
                onDurationChanged: _handleDurationChanged,
                onRepeatCountChanged: _handleRepeatCountChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Controls extends StatelessWidget {
  const _Controls({
    required this.count,
    required this.duration,
    required this.repeatCount,
    required this.onCountChanged,
    required this.onDurationChanged,
    required this.onRepeatCountChanged,
  });

  final int count;
  final int duration;
  final int repeatCount;
  final ValueChanged<double> onCountChanged;
  final ValueChanged<double> onDurationChanged;
  final ValueChanged<double> onRepeatCountChanged;

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {
        0: FixedColumnWidth(70),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(30),
      },
      children: [
        TableRow(
          children: [
            const Text('Count', textAlign: TextAlign.right),
            Slider(
              value: count.toDouble(),
              min: 1,
              max: 9,
              onChanged: onCountChanged,
            ),
            Text(count.toString()),
          ],
        ),
        TableRow(
          children: [
            const Text('Duration', textAlign: TextAlign.right),
            Slider(
              value: duration.toDouble(),
              min: 1,
              max: 6,
              onChanged: onDurationChanged,
            ),
            Text(duration.toString()),
          ],
        ),
        TableRow(
          children: [
            const Text('Repeats', textAlign: TextAlign.right),
            Slider(
              value: repeatCount.toDouble(),
              min: 0,
              max: 10,
              onChanged: onRepeatCountChanged,
            ),
            Text(repeatCount.toString()),
          ],
        ),
      ],
    );
  }
}

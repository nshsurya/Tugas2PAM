import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  Stopwatch _stopwatch = Stopwatch();  // Stopwatch object
  Timer? _timer;  // Timer for updating the UI
  String _elapsedTime = '00:00:00.00';  // Display string for time
  List<String> _flagTimes = [];  // List to store flag times (laps)

  // Format elapsed time into hours, minutes, seconds, and milliseconds
  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String threeDigits(int n) => n.toString().padLeft(2, "0");

    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final milliseconds = threeDigits(duration.inMilliseconds.remainder(100));

    return "$hours:$minutes:$seconds.$milliseconds";
  }

  // Start the stopwatch and update the time every 100 milliseconds
  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {
        _elapsedTime = _formatTime(_stopwatch.elapsed);
      });
    });
  }

  // Start stopwatch
  void _startStopwatch() {
    setState(() {
      _stopwatch.start();
    });
    _startTimer();
  }

  // Stop stopwatch
  void _stopStopwatch() {
    setState(() {
      _stopwatch.stop();
    });
    _timer?.cancel();
  }

  // Reset stopwatch and clear flags
  void _resetStopwatch() {
    setState(() {
      _stopwatch.reset();
      _elapsedTime = '00:00:00.00';
      _flagTimes.clear();  // Clear the flag list when reset
    });
    _timer?.cancel();
  }

  // Add flag (lap time)
  void _addFlag() {
    setState(() {
      _flagTimes.add(_formatTime(_stopwatch.elapsed));
    });
  }

  @override
  void dispose() {
    _timer?.cancel();  // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFFDD4D7),
      appBar: AppBar(
        title: Text('Stopwatch', style: TextStyle(color: Colors.white)),
         backgroundColor: const Color(0xFFF2808A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Display the elapsed time with milliseconds
            Text(
              _elapsedTime,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Row for the Start, Stop, Reset, and Flag buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Start Button
                ElevatedButton(
                  onPressed: !_stopwatch.isRunning ? _startStopwatch : null,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    'Start',
                    style: TextStyle(fontSize: 18, color: Color(0xFFD95F76)),
                  ),
                ),
                // Stop Button
                ElevatedButton(
                  onPressed: _stopwatch.isRunning ? _stopStopwatch : null,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    'Stop',
                    style: TextStyle(fontSize: 18, color: Color(0xFFD95F76)),
                  ),
                ),
                // Reset Button
                ElevatedButton(
                  onPressed: !_stopwatch.isRunning && _stopwatch.elapsedMilliseconds > 0
                      ? _resetStopwatch
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    'Reset',
                    style: TextStyle(fontSize: 18, color: Color(0xFFD95F76)), 
                  ),
                ),
                // Flag Button
                ElevatedButton(
                  onPressed: _stopwatch.isRunning ? _addFlag : null,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    'Flag',
                    style: TextStyle(fontSize: 18, color: Color(0xFFD95F76)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Display the flags (lap times) in a ListView
            Expanded(
              child: ListView.builder(
                itemCount: _flagTimes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text('Lap ${index + 1}'),
                    title: Text(_flagTimes[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
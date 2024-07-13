import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_log_app/src/theme/style.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Mood', style: TextStyle(color: Colors.black)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCard('Sleep Quality', '+5%', '+2%', _buildLineChart()),
              const SizedBox(height: 16),
              _buildCard('Mood', '+10%', '+3%', _buildBarChart()),
              const SizedBox(height: 24),
              const Text('Your Schedule',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildScheduleCard('11:15 PM', 'Bedtime')),
                  const SizedBox(width: 16),
                  Expanded(child: _buildScheduleCard('8:15 AM', 'Wake up')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
      String title, String mainValue, String subValue, Widget chart) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(
            color: Color.fromARGB(255, 217, 217, 217), width: 1.0), // Kenarlık eklemek için
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(mainValue,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Row(
              children: [
                const Text('Past week',
                    style: TextStyle(color: foreignBlue, fontSize: 16.0)),
                const SizedBox(
                  width: 5.0,
                ),
                Text(subValue,
                    style:
                        const TextStyle(color: Colors.green, fontSize: 16.0)),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(height: 200, child: chart),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: ['M', 'T', 'W', 'T', 'F', 'S', 'S']
                    .map((day) => Text(day))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLineChart() {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 3),
              const FlSpot(1, 4),
              const FlSpot(2, 3.5),
              const FlSpot(3, 5),
              const FlSpot(4, 3),
              const FlSpot(5, 4),
              const FlSpot(6, 4),
            ],
            isCurved: true,
            color: foreignBlue,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart() {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
        barTouchData: BarTouchData(enabled: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 8)]),
          BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 10)]),
          BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 14)]),
          BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 15)]),
          BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 13)]),
          BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 10)]),
          BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 16)]),
        ],
      ),
    );
  }

  Widget _buildScheduleCard(String time, String activity) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(
            color: Color.fromARGB(255, 217, 217, 217), width: 1.0), // Kenarlık eklemek için
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.access_time, color: foreignBlack),
            const SizedBox(height: 8),
            Text(time, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(activity, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

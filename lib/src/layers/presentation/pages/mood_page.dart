import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_log_app/src/theme/style.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  List<String> monthList = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'];
  List<String> dayList = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

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
        title: const Text('Mood',
            style: TextStyle(color: foreignBlack, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child:
                    _buildCard('Daily Mood', '5.1', '+2%', _buildLineChart(), false),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: _buildCard('Overall Mood', '4.9', '+3%', _buildBarChart(), true),
              ),
              const Text('Your Schedule',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Expanded(child: _buildScheduleCard('11:15 PM', 'Bedtime')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildScheduleCard('8:15 AM', 'Wake up')),
                  ],
                ),
              ),
              const Text(
                'Your moods have been mostly positive',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Expanded(
                        child: _buildMoodChangesCard(
                            'Positive', 'Average score is 5.1', true)),
                    const SizedBox(width: 16),
                    Expanded(
                        child: _buildMoodChangesCard(
                            'Lowest', 'Lowest score was 4.6 on Dec 26', false)),
                  ],
                ),
              ),
              const Text(
                'Your mood has improved',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Expanded(
                        child: _buildMoodChangesCard(
                            'Change', 'Improvement of 0.4', true)),
                    const SizedBox(width: 16),
                    Expanded(
                        child: _buildMoodChangesCard(
                            'Rate', '15% increase in the past month', true)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
      String title, String mainValue, String subValue, Widget chart, bool isMonthly) {
    
    List<String> items = isMonthly ? monthList : dayList;

    return Card(
      elevation: 0,
      color: Colors.transparent,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(15.0),
      //   side: const BorderSide(
      //       color: Color.fromARGB(255, 217, 217, 217),
      //       width: 1.0), // Kenarlık eklemek için
      // ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Text(mainValue,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Text(isMonthly ? 'Past Month' : 'Past Week',
                    style: const TextStyle(color: foreignBlue, fontSize: 16.0)),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  subValue,
                  style: const TextStyle(color: Colors.green, fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(height: 200, child: chart),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: items
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
            color: Color.fromARGB(255, 217, 217, 217),
            width: 1.0), // Kenarlık eklemek için
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

  Widget _buildMoodChangesCard(
      String title, String description, bool isHigher) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(
            color: Color.fromARGB(255, 217, 217, 217),
            width: 1.0), // Kenarlık eklemek için
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(isHigher ? Icons.arrow_upward : Icons.arrow_downward,
                color: foreignBlack),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(description, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

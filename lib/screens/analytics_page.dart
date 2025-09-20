import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Analytics")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Fleet Overview",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Pie Chart Example: Vehicle Status
            const Text(
              "Vehicle Status",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 200, child: VehicleStatusPieChart()),
            const SizedBox(height: 24),

            // Bar Chart Example: Trips per Month
            const Text(
              "Trips Per Month",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 200, child: TripsBarChart()),
          ],
        ),
      ),
    );
  }
}

// ---------------- Pie Chart ----------------
class VehicleStatusPieChart extends StatelessWidget {
  const VehicleStatusPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: 10,
            color: Colors.green,
            title: 'Active',
            radius: 50,
          ),
          PieChartSectionData(
            value: 3,
            color: Colors.orange,
            title: 'Idle',
            radius: 50,
          ),
          PieChartSectionData(
            value: 2,
            color: Colors.red,
            title: 'Maintenance',
            radius: 50,
          ),
        ],
        sectionsSpace: 2,
        centerSpaceRadius: 30,
      ),
    );
  }
}

// ---------------- Bar Chart ----------------
class TripsBarChart extends StatelessWidget {
  const TripsBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 15,
        barTouchData: BarTouchData(enabled: true),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, interval: 5),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const months = [
                  "Jan",
                  "Feb",
                  "Mar",
                  "Apr",
                  "May",
                  "Jun",
                  "Jul",
                  "Aug",
                  "Sep",
                  "Oct",
                  "Nov",
                  "Dec",
                ];
                return Text(months[value.toInt() % 12]);
              },
              interval: 1,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(
          8,
          (index) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: (index + 5).toDouble(),
                color: Colors.blue,
                width: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

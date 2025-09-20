// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Sample data for the dashboard
  final List<Map<String, dynamic>> _statsData = [
    {
      'title': 'Vehicles',
      'value': '87',
      'icon': Icons.directions_car,
      'color': Colors.blue.shade400,
    },
    {
      'title': 'Drivers',
      'value': '45',
      'icon': Icons.person,
      'color': Colors.indigo.shade400,
    },
    {
      'title': 'Users',
      'value': '234',
      'icon': Icons.people,
      'color': Colors.lightBlue.shade400,
    },
    {
      'title': 'Accidents',
      'value': '3',
      'icon': Icons.warning,
      'color': Colors.red.shade400,
    },
  ];

  final List<Map<String, dynamic>> _quickStats = [
    {
      'title': 'Shuttles',
      'value': '12',
      'icon': Icons.airport_shuttle,
      'color': Colors.teal.shade400,
    },
    {
      'title': 'Parking Slots',
      'value': '156',
      'icon': Icons.local_parking,
      'color': Colors.green.shade400,
    },
    {
      'title': 'Active Trips',
      'value': '28',
      'icon': Icons.route,
      'color': Colors.orange.shade400,
    },
  ];

  final List<Map<String, dynamic>> _recentActivities = [
    {
      'title': 'Vehicle CAR-001 completed trip',
      'time': '2 min ago',
      'icon': Icons.check_circle,
      'color': Colors.green,
    },
    {
      'title': 'Driver John assigned to route',
      'time': '15 min ago',
      'icon': Icons.person_add,
      'color': Colors.blue,
    },
    {
      'title': 'Maintenance scheduled for VAN-042',
      'time': '1 hour ago',
      'icon': Icons.build,
      'color': Colors.orange,
    },
    {
      'title': 'New parking slot reserved',
      'time': '2 hours ago',
      'icon': Icons.local_parking,
      'color': Colors.blue,
    },
  ];

  final List<Map<String, dynamic>> _drawerItems = [
    {'title': 'Dashboard', 'icon': Icons.dashboard},
    {'title': 'Vehicles', 'icon': Icons.directions_car},
    {'title': 'Drivers', 'icon': Icons.person},
    {'title': 'Users', 'icon': Icons.people},
    {'title': 'Accidents', 'icon': Icons.warning},
    {'title': 'Shuttles', 'icon': Icons.airport_shuttle},
    {'title': 'Parking', 'icon': Icons.local_parking},
    {'title': 'Trips', 'icon': Icons.route},
    {'title': 'Live Tracking', 'icon': Icons.location_on},
    {'title': 'Maintenance', 'icon': Icons.build},
    {'title': 'Analytics', 'icon': Icons.analytics},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      drawer: _buildDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildSectionTitle('Fleet Overview'),
                  const SizedBox(height: 16),
                  _buildStatsGrid(),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Fleet Distribution'),
                  const SizedBox(height: 16),
                  _buildFleetDistributionCard(),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Quick Stats'),
                  const SizedBox(height: 16),
                  _buildQuickStatsGrid(),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Recent Activity'),
                  const SizedBox(height: 16),
                  _buildRecentActivityList(),
                ],
              ),
            ),
          ],
        ),
      ).animate().fadeIn(duration: 600.ms),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue.shade600, Colors.blue.shade500],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade200,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Builder(
            builder: (BuildContext builderContext) {
              return Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.menu,
                        size: 28.0,
                        color: Colors.white,
                      ),
                      onPressed: () => Scaffold.of(builderContext).openDrawer(),
                    ),
                  )
                  .animate()
                  .scale(delay: 200.ms, duration: 400.ms)
                  .shimmer(delay: 600.ms, duration: 1000.ms);
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Fleet Management',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ).animate().slideX(delay: 300.ms, duration: 600.ms).fadeIn(),
                  const Text(
                    'Monitor your fleet operations in real-time',
                    style: TextStyle(fontSize: 16.0, color: Colors.white70),
                  ).animate().slideX(delay: 500.ms, duration: 600.ms).fadeIn(),
                ],
              ),
            ),
          ),
          // Navigate to the notifications page when the icon is pressed
          IconButton(
            icon:
                Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.notifications_outlined,
                        size: 28.0,
                        color: Colors.white,
                      ),
                    )
                    .animate()
                    .scale(delay: 400.ms, duration: 400.ms)
                    .shake(delay: 2000.ms),
            onPressed: () {
              // Navigate to the notifications page using its named route
              Navigator.pushNamed(context, '/notifications');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.3,
      ),
      itemCount: _statsData.length,
      itemBuilder: (context, index) {
        final stat = _statsData[index];
        return _buildStatCard(
          stat['title'],
          stat['value'],
          stat['icon'],
          stat['color'],
          index,
        );
      },
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
    int index,
  ) {
    return Card(
          elevation: 8,
          shadowColor: color.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color, color.withOpacity(0.8)],
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: Colors.white).animate().scale(
                  delay: (index * 100 + 200).ms,
                  duration: 600.ms,
                ),
                const SizedBox(height: 12),
                Text(
                      value,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                    .animate()
                    .slideY(delay: (index * 100 + 400).ms, duration: 500.ms)
                    .fadeIn(),
                const SizedBox(height: 4),
                Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                    .animate()
                    .slideY(delay: (index * 100 + 600).ms, duration: 500.ms)
                    .fadeIn(),
              ],
            ),
          ),
        )
        .animate()
        .scale(
          delay: (index * 100).ms,
          duration: 800.ms,
          curve: Curves.elasticOut,
        )
        .shimmer(delay: (index * 100 + 1000).ms, duration: 1500.ms);
  }

  Widget _buildQuickStatsGrid() {
    return Row(
      children: _quickStats.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> stat = entry.value;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index < _quickStats.length - 1 ? 12 : 0,
            ),
            child: _buildQuickStatCard(
              stat['title'],
              stat['value'],
              stat['icon'],
              stat['color'],
              index,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildQuickStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
    int index,
  ) {
    return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: color.withOpacity(0.1),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  radius: 25,
                  child: Icon(icon, color: Colors.white, size: 28),
                ).animate().scale(
                  delay: (index * 150 + 800).ms,
                  duration: 600.ms,
                ),
                const SizedBox(height: 12),
                Text(
                      value,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    )
                    .animate()
                    .slideY(delay: (index * 150 + 1000).ms, duration: 500.ms)
                    .fadeIn(),
                const SizedBox(height: 4),
                Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                    .animate()
                    .slideY(delay: (index * 150 + 1200).ms, duration: 500.ms)
                    .fadeIn(),
              ],
            ),
          ),
        )
        .animate()
        .slideX(delay: (index * 150 + 600).ms, duration: 700.ms)
        .fadeIn();
  }

  Widget _buildFleetDistributionCard() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade200),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.donut_small, size: 80, color: Colors.blue.shade300)
                      .animate()
                      .rotate(delay: 1000.ms, duration: 2000.ms)
                      .then()
                      .shimmer(duration: 1000.ms),
                  const SizedBox(height: 8),
                  Text(
                    'Fleet Distribution Chart',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ).animate().fadeIn(delay: 1200.ms, duration: 800.ms),
                ],
              ),
            ).animate().slideY(delay: 800.ms, duration: 800.ms).fadeIn(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildChartLegend('Active', Colors.green.shade500, 65, 0),
                _buildChartLegend('Maintenance', Colors.orange.shade500, 20, 1),
                _buildChartLegend('Idle', Colors.grey.shade400, 15, 2),
              ],
            ),
          ],
        ),
      ),
    ).animate().slideY(delay: 600.ms, duration: 800.ms).fadeIn();
  }

  Widget _buildChartLegend(
    String label,
    Color color,
    int percentage,
    int index,
  ) {
    return Column(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ).animate().scale(delay: (1400 + index * 100).ms, duration: 400.ms),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ).animate().fadeIn(delay: (1600 + index * 100).ms, duration: 400.ms),
        Text(
              '$percentage%',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            )
            .animate()
            .fadeIn(delay: (1800 + index * 100).ms, duration: 400.ms)
            .shimmer(delay: (2200 + index * 100).ms, duration: 800.ms),
      ],
    );
  }

  Widget _buildRecentActivityList() {
    return Column(
      children: _recentActivities.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> activity = entry.value;

        return Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: activity['color'].withOpacity(0.2),
                  child: Icon(
                    activity['icon'],
                    color: activity['color'],
                    size: 20,
                  ),
                ),
                title: Text(
                  activity['title'],
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  activity['time'],
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Tapped on: ${activity['title']}'),
                      backgroundColor: activity['color'],
                    ),
                  );
                },
              ),
            )
            .animate()
            .slideX(delay: (1400 + index * 100).ms, duration: 600.ms)
            .fadeIn();
      }).toList(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade50, Colors.white],
          ),
        ),
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade600, Colors.blue.shade500],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Fleet Manager',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Control Panel',
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ],
                  ).animate().slideX(duration: 600.ms).fadeIn(),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ).animate().scale(delay: 400.ms, duration: 400.ms),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _drawerItems.length,
                itemBuilder: (context, index) {
                  final item = _drawerItems[index];
                  return _buildDrawerItem(
                    item['title'],
                    item['icon'],
                    index == _selectedIndex,
                    index,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildDrawerItem(
                'Settings',
                Icons.settings,
                false,
                _drawerItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    String title,
    IconData icon,
    bool isActive,
    int index,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue.shade100 : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isActive ? Colors.blue.shade600 : Colors.grey.shade600,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.blue.shade600 : Colors.black87,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
          Navigator.of(context).pop(); // close drawer
          // Navigate to the correct page based on title
          switch (title) {
            case 'Dashboard':
              // This is the dashboard itself, so we don't need to push a new route
              break;
            case 'Vehicles':
              Navigator.pushNamed(context, '/vehicle_registration');
              break;
            case 'Drivers':
              Navigator.pushNamed(context, '/drivers');
              break;
            case 'Users':
              Navigator.pushNamed(context, '/users');
              break;
            case 'Accidents':
              Navigator.pushNamed(context, '/accidents');
              break;
            case 'Shuttles':
              Navigator.pushNamed(context, '/shuttles');
              break;
            case 'Parking':
              Navigator.pushNamed(context, '/parking');
              break;
            case 'Trips':
              Navigator.pushNamed(context, '/trips');
              break;
            case 'Live Tracking':
              Navigator.pushNamed(context, '/live-tracking');
              break;
            case 'Maintenance':
              Navigator.pushNamed(context, '/maintenance');
              break;
            case 'Analytics':
              Navigator.pushNamed(context, '/analytics');
              break;
            case 'Settings':
              Navigator.pushNamed(context, '/settings');
              break;
            default:
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Page $title not implemented')),
              );
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ).animate().slideX(delay: (index * 50).ms, duration: 400.ms).fadeIn();
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.blue.shade700,
      ),
    ).animate().slideX(duration: 600.ms).fadeIn();
  }
}

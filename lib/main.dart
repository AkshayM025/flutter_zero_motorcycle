import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Centers tabs within row
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: 16), // Adds spacing between icon and tabs
                        child: Image.asset(
                          'assets/images/zero.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center, // Centers the TabBar
                          child: TabBar(
                            controller: _tabController,
                            indicatorColor: Colors.orange,
                            labelColor: Colors.orange,
                            unselectedLabelColor: Colors.black,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: [
                              Tab(text: 'Dashboard'),
                              Tab(text: 'Feedback'),
                              Tab(text: 'Settings'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [DashboardPage(), FeedbackPage(), SettingsPage()],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 340,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF44505E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.green, size: 12),
                          SizedBox(width: 5),
                          Text('ARMED',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Center(
                        child:
                            Image.asset('assets/images/bike.png', height: 210),
                      ),
                      Spacer(),
                      Text('2024 DSR/X',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('DUAL SPORT',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                          Text('VIN: 219479120142',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Container(
                  height: 340,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFEAF2FB),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Faults',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          SizedBox(width: 10),
                          Center(
                            child: Image.asset('assets/images/black_cell.png'),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Center(
                      //     child: Icon(Icons.warning,
                      //         color: Colors.orange, size: 40)),
                      Center(
                        child: Image.asset('assets/images/fault.png'),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:
                              CrossAxisAlignment.center, // Align items properly
                          children: [
                            Expanded(
                              // Allows the text section to take up available space
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Image.asset(
                                      'assets/images/orange_cell.png',
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          10), // Added spacing instead of Spacer
                                  Expanded(
                                    // Prevents text from overflowing
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'High Throttle',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Throttle input exceeded limit',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                width:
                                    10), // Ensures spacing between text and button
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Troubleshoot',
                                style: TextStyle(color: Colors.orange),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Flexible(
                child: Container(
                  width: 302,
                  height: 116,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '12V',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Battery Voltage',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              Flexible(
                child: Container(
                  width: 305,
                  height: 116,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/electro.png',
                            height: 50,
                            width: 40,
                          ),
                          SizedBox(width: 8), // Space between image and text
                          Text(
                            '56%',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Text(
                        'State of Charge',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(
                      horizontal: 32, vertical: 18), // Increased padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        50), // More rounded for a pill shape
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize:
                      MainAxisSize.min, // Button only takes necessary space
                  children: [
                    Text(
                      'Start Repair',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white), // Bigger text
                    ),
                    SizedBox(width: 12),
                    Image.asset(
                      'assets/images/arrow.png',
                      height: 26,
                      width: 26,
                      color: Colors.white,
                    ), // More space between text and icon
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Feedback Page', style: TextStyle(fontSize: 24)),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Page', style: TextStyle(fontSize: 24)),
    );
  }
}

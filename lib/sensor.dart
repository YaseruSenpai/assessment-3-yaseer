import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

const String FIREBASE_HOST = "authenticationapp-29d0b-default-rtdb.asia-southeast1.firebasedatabase.app";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sensor Monitor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const SensorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SensorPage extends StatefulWidget {
  const SensorPage({super.key});

  @override
  _SensorPageState createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  late DatabaseReference _sensorRef;

  double temperature = 0.0;
  double humidity = 0.0;
  int moisture = 0;

  @override
  void initState() {
    super.initState();

    final database = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: 'https://$FIREBASE_HOST/',
    );

    _sensorRef = database.ref('Sensor');

    _sensorRef.onValue.listen((event) {
      final data = event.snapshot.value;

      if (data != null && data is Map) {
        final sensorData = Map<String, dynamic>.from(data);
        setState(() {
          temperature = sensorData['DHT_Temperature']?.toDouble() ?? 0.0;
          humidity = sensorData['Humidity']?.toDouble() ?? 0.0;
          moisture = sensorData['Moisture']?.toInt() ?? 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🌱 Sensor Monitor'),
        backgroundColor: Colors.blueAccent,
        elevation: 5,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.indigo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SensorCard(
              label: 'Temperature',
              value: '$temperature °C',
              icon: Icons.thermostat,
            ),
            const SizedBox(height: 20),
            SensorCard(
              label: 'Humidity',
              value: '$humidity %',
              icon: Icons.water_drop,
            ),
            const SizedBox(height: 20),
            SensorCard(
              label: 'Soil Moisture',
              value: '$moisture %',
              icon: Icons.grass,
            ),
          ],
        ),
      ),
    );
  }
}

class SensorCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const SensorCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white.withOpacity(0.9),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.blueAccent,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:aero_drought/routes/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background for a modern feel
      appBar: AppBar(
        centerTitle: true, // Center the title for a balanced look
        elevation: 0, // Remove shadow for a flat design
        backgroundColor: Colors.green, // Brand color
        title: Text(
          'AeroDrought',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch to fill width
        children: [
          // Add some top padding
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: GestureDetector(
              onTap: () {
                Routes.go(
                  Routes.results,
                );
              },
              child: Card(
                elevation: 6, // Add elevation for a shadow effect
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 25,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Upload Image',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.green[800],
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Icon(
                        Icons.cloud_upload,
                        size: 30,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30), // Add spacing
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              "Identify plant health and get suggestions",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700],
                    fontSize: 16,
                    height: 1.4,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

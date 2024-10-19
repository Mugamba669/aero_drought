import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class RecommendationsPage extends StatefulWidget {
  const RecommendationsPage({super.key});

  @override
  State<RecommendationsPage> createState() => _RecommendationsPageState();
}

class _RecommendationsPageState extends State<RecommendationsPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers for slide and fade
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.3), // Start from below
      end: Offset.zero, // Slide to original position
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Start the animations after the widget loads
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildRecommendationCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: color.withOpacity(0.2),
              child: Icon(
                icon,
                color: color,
                size: 30,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendations'),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.apply(
              fontWeightDelta: 5,
              color: Colors.white,
            ),
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SlideTransition(
            position: _offsetAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Section Header
                  Text(
                    'Recommendations for Your Plant',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade800,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // Recommendation Cards
                  _buildRecommendationCard(
                    icon: Icons.wb_sunny,
                    title: 'Sunlight',
                    subtitle:
                        'Ensure your plant gets 6 hours of direct sunlight daily.',
                    color: Colors.orange.shade600,
                  ),
                  _buildRecommendationCard(
                    icon: Icons.water_drop,
                    title: 'Watering',
                    subtitle:
                        'Water your plant twice a week to maintain optimal soil moisture.',
                    color: Colors.blue.shade600,
                  ),
                  _buildRecommendationCard(
                    icon: Icons.spa,
                    title: 'Soil Quality',
                    subtitle:
                        'Use well-draining soil with organic matter for better growth.',
                    color: Colors.brown.shade600,
                  ),
                  _buildRecommendationCard(
                    icon: Icons.thermostat,
                    title: 'Temperature',
                    subtitle:
                        'Keep your plant in temperatures between 20°C - 25°C.',
                    color: Colors.red.shade600,
                  ),
                  _buildRecommendationCard(
                    icon: Icons.local_florist,
                    title: 'Fertilization',
                    subtitle:
                        'Add organic fertilizer once a month for healthy growth.',
                    color: Colors.green.shade600,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

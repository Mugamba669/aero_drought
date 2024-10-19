import 'package:aero_drought/routes/routes.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background for clean design
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Results'),
        centerTitle: true,
        toolbarHeight: 70,
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: constraints.maxHeight * 0.05),
                // Image Section
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/launch.png',
                      width: constraints.maxWidth * 0.8,
                      height: constraints.maxWidth * 0.8,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Plant Info Section
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 28, 10, 8),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        // Plant Name
                        TextSpan(
                          text: 'Plant Name: ',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                        ),
                        TextSpan(
                          text: ' Nakati',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.green.shade800,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        // Botanical Name
                        TextSpan(
                          text: '\n\nBotanical Name: ',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                        ),
                        TextSpan(
                          text: ' Solanum aethiopicum',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.green.shade800,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        // Health Status
                        TextSpan(
                          text: '\n\nHealth Status: ',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                        ),
                        TextSpan(
                          text: ' Healthy',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.green.shade800,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.1),
                // Button Section
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 8, 10, 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        elevation: 5,
                      ),
                      onPressed: () {
                        Routes.go(Routes.recommendation);
                      },
                      child: Text(
                        "View Recommendations",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

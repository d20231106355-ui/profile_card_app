import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const ProfessionalProfileApp());
}

class ProfessionalProfileApp extends StatelessWidget {
  const ProfessionalProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'About Me',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // ==================== LAUNCH FUNCTIONS ====================
  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'nrlndzrhnm@gmail.com',
    );
    if (!await launchUrl(emailUri)) {
      throw Exception('Could not launch email');
    }
  }

  Future<void> _launchWhatsApp() async {
    final Uri whatsappUri = Uri.parse(
      'https://wa.me/60108474194'  
    );
    if (!await launchUrl(whatsappUri)) {
      throw Exception('Could not launch WhatsApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            child: Card(
              elevation: 12,
              shadowColor: Colors.blue.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width > 400
                    ? 32.0
                    : 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Profile Picture
                    const CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    const SizedBox(height: 24),

                    // Full Name
                    const Text(
                      'Nadzirah Mohammad',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Professional Title
                    const Text(
                      'Student',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Date of Birth & State
                    const Text(
                      '30/04/2003 | Malacca',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Contact Section 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildContactButton(
                          icon: Icons.email,
                          color: Colors.red[400]!,
                          label: 'nrlndzrhnm@gmail.com',
                          onPressed: _launchEmail,  
                        ),
                        const SizedBox(width: 24),
                        _buildContactButton(
                          icon: Icons.message, 
                          color: Colors.green,
                          label: 'WhatsApp',
                          onPressed: _launchWhatsApp, 
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Bio Quote
                    const Text(
                      '"Just a student handling assignments, coffee, and big dreams. Always curious and always ready to learn something new."',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                        color: Colors.black87,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Skills Section
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth < 400) {
                          return Column(
                            children: const [
                              Chip(label: Text('Flutter'), backgroundColor: Colors.blue),
                              SizedBox(height: 8),
                              Chip(label: Text('Dart'), backgroundColor: Colors.blueGrey),
                              SizedBox(height: 8),
                              Chip(label: Text('VScode'), backgroundColor: Colors.purple),
                            ],
                          );
                        }
                        return const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Chip(label: Text('Flutter'), backgroundColor: Colors.blue),
                            SizedBox(width: 8),
                            Chip(label: Text('Dart'), backgroundColor: Colors.blueGrey),
                            SizedBox(width: 8),
                            Chip(label: Text('VScode'), backgroundColor: Colors.purple),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactButton({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon, color: color, size: 24),
            onPressed: onPressed,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
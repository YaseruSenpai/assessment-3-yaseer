import 'package:flutter/material.dart';


class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FAQs',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            faqItem('How do I log in?', 'You can log in using your registered email and password. If you forget your password, use the reset password option.'),
            faqItem('How do I update my profile?', 'Go to the Profile page and tap the edit button to update your details.'),
            faqItem('How do I contact support?', 'You can reach us via email or phone. Details are below.'),

            const SizedBox(height: 20),
            const Text(
              'Contact Support',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            contactInfo('Phone', '+6011 1189 0912', Icons.phone),
            contactInfo('Email', 'zerotwo694@gmail.com', Icons.email),
            contactInfo('Website', 'www.google.com', Icons.web),

            const SizedBox(height: 20),
            const Text(
              'Video Tutorial',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  icon: const Icon(Icons.play_circle_fill, size: 50, color: Colors.white),
                  onPressed: () {
                    // Add navigation to video tutorial
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget faqItem(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            answer,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget contactInfo(String title, String value, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      subtitle: Text(value, style: const TextStyle(fontSize: 16)),
    );
  }
}

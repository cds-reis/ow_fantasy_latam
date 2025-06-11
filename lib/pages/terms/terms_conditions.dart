import 'package:flutter/material.dart';

import '../../config/constants.dart' as constants;

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  static const String routeName = '/terms';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SelectionArea(
        child: SizedBox(
          width: 1200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              const Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        'Last updated: 11/06/2025',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '1. Introduction',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Welcome to OW Fantasy LATAM. These Terms and Conditions govern your use of our fantasy Overwatch competition platform. By accessing or using our service, you agree to be bound by these terms. If you disagree with any part of these terms, you may not access the service.\n\n'
                        'OW Fantasy LATAM is operated from Brazil and is subject to Brazilian law. These terms should be read in conjunction with our Privacy Policy.',
                      ),
                      Divider(),
                      Text(
                        '2. Eligibility',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'To use our service, you must:\n'
                        '• Be at least 13 years old\n'
                        '• Have a valid email address\n'
                        '• Comply with all applicable laws and regulations\n'
                        '• Not be prohibited from using the service under any applicable laws\n\n'
                        'We reserve the right to refuse service to anyone for any reason at our discretion.',
                      ),
                      Divider(),
                      Text(
                        '3. Account Registration',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'When creating an account, you must provide accurate and complete information. You are responsible for:\n'
                        '• Maintaining the security of your account\n'
                        '• All activities that occur under your account\n'
                        '• Notifying us immediately of any unauthorized use\n\n'
                        'We reserve the right to suspend or terminate accounts that violate these terms.',
                      ),
                      Divider(),
                      Text(
                        '4. Fantasy Competition Rules',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '4.1. Team Selection:\n'
                        '• Teams must be selected before the specified deadline\n'
                        '• Changes to teams are only allowed during designated periods\n'
                        '• All selections must comply with competition rules\n\n'
                        '4.2. Scoring:\n'
                        '• Points are awarded based on official League statistics\n'
                        '• All scoring decisions are final\n'
                        '• We reserve the right to adjust scoring rules with notice\n\n'
                        '4.3. Prizes:\n'
                        '• Prize distribution is subject to verification\n'
                        '• Winners must provide valid identification\n'
                        '• Prizes are non-transferable',
                      ),
                      Divider(),
                      Text(
                        '5. User Conduct',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'You agree not to:\n'
                        '• Violate any laws or regulations\n'
                        '• Impersonate others or provide false information\n'
                        '• Interfere with the proper functioning of the service\n'
                        '• Attempt to manipulate competition results\n'
                        '• Use automated systems or bots\n'
                        '• Harass, abuse, or harm others\n'
                        '• Share account credentials',
                      ),
                      Divider(),
                      Text(
                        '6. Intellectual Property',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'The service and its original content, features, and functionality are owned by OW Fantasy LATAM and are protected by international copyright, trademark, and other intellectual property laws. You may not reproduce, distribute, or create derivative works without our permission.',
                      ),
                      Divider(),
                      Text(
                        '7. Limitation of Liability',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'To the maximum extent permitted by law, OW Fantasy LATAM shall not be liable for any indirect, incidental, special, consequential, or punitive damages resulting from your use of or inability to use the service.',
                      ),
                      Divider(),
                      Text(
                        '8. Changes to Terms',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'We reserve the right to modify these terms at any time. We will notify users of any material changes. Your continued use of the service after such modifications constitutes your acceptance of the new terms.',
                      ),
                      Divider(),
                      Text(
                        '9. Contact Information',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'For questions about these Terms and Conditions, please contact us at:\n'
                        '• E-mail: ${constants.email}',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

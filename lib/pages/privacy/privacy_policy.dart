import 'package:flutter/material.dart';

import '../../config/constants.dart' as constants;

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  static const String routeName = '/privacy';

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
                'Privacy Policy',
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
                        'This Privacy Policy describes how the OW Fantasy LATAM ("we", "our" or "app") collects, uses, and protects your personal information in accordance with the General Data Protection Law (LGPD - Law No. 13.709/2018) of Brazil.\n\n'
                        'OW Fantasy LATAM is the organiser and operator of fantasy Overwatch competitions, primarily for the South American region. We are based in Brazil and operate globally, subject to applicable laws and regulations.\n\n'
                        'For the purposes of data protection law, OW Fantasy LATAM is the data controller of your personal data.',
                      ),
                      Divider(),
                      Text(
                        '2. Data We Collect',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '2.1. Account Information:\n'
                        '• Username\n'
                        '• Email\n'
                        '• Password (stored securely and encrypted)\n\n'
                        '2.2. Gameplay Data:\n'
                        '• Fantasy team selections\n'
                        '• Contest entries\n'
                        '• Scoring history\n'
                        '• Rankings',
                      ),
                      Divider(),
                      Text(
                        '3. How we use your data',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'We use your data to:\n'
                        '• Provide and maintain our services\n'
                        '• Personalize your experience\n'
                        '• Send important updates\n'
                        '• Improve our services\n'
                        '• Comply with legal obligations',
                      ),
                      Divider(),
                      Text(
                        '4. Data Sharing',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'We do not share your personal data with third parties, except when:\n'
                        '• Required by law\n'
                        '• Necessary to protect our rights\n'
                        '• With your explicit consent',
                      ),
                      Divider(),
                      Text(
                        '5. Your Rights',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'According to the LGPD, you have the right to:\n'
                        '• Access your personal data\n'
                        '• Correct incomplete or outdated data\n'
                        '• Request the deletion of your data\n'
                        '• Revoke your consent\n'
                        '• Request the portability of your data\n'
                        '• Obtain information about data sharing',
                      ),
                      Divider(),
                      Text(
                        '6. Data Security',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'We implement technical and organizational security measures to protect your personal data, including:\n'
                        '• Data encryption\n'
                        '• Access controls\n'
                        '• Security monitoring\n'
                        '• Team training',
                      ),
                      Divider(),
                      Text(
                        '7. Data Retention',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'We retain your personal data only for the time necessary to fulfill the purposes for which it was collected, including legal, accounting or reporting obligations.',
                      ),
                      Divider(),
                      Text(
                        '8. Contact',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'To exercise your rights or ask questions about this policy, contact us through:\n'
                        '• E-mail: ${constants.email}',
                      ),
                      Divider(),
                      Text(
                        '9. Changes to the Policy',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'We reserve the right to modify this policy at any time. Significant changes will be notified through the app or by email.',
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

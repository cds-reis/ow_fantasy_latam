import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/hardstring.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const String routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 1200,
        child: SelectionArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              Text(
                'About'.hardString,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      const Text(
                        '1. Introduction',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SelectableText.rich(
                        TextSpan(
                          style: const TextStyle(fontSize: 14),
                          children: [
                            const TextSpan(
                              text:
                                  'Welcome to OWCS Fantasy - LATAM! This is a passion project inspired from ',
                            ),
                            WidgetSpan(
                              child: Link(
                                uri: Uri.parse('https://owfantasy.com/home'),
                                builder: (context, child) {
                                  return InkWell(
                                    onTap: () {
                                      launchUrl(
                                        Uri.parse('https://owfantasy.com/home'),
                                      );
                                    },
                                    child: const Text(
                                      'OW Fantasy',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.blue,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const TextSpan(
                              text:
                                  ' and has no affiliation with the original OW Fantasy. This project is run by me, ',
                            ),
                            WidgetSpan(
                              child: Link(
                                uri: Uri.parse('https://x.com/RafinhaOLindao'),
                                builder: (context, child) {
                                  return InkWell(
                                    onTap: () {
                                      launchUrl(
                                        Uri.parse(
                                          'https://x.com/TotallyNotToby1',
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'RafinhaOLindao',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.blue,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const TextSpan(
                              text: ' with the assistance of ',
                            ),
                            WidgetSpan(
                              child: Link(
                                uri: Uri.parse('https://x.com/Blankezz_'),
                                builder: (context, child) {
                                  return InkWell(
                                    onTap: () {
                                      launchUrl(
                                        Uri.parse('https://x.com/Blankezz_'),
                                      );
                                    },
                                    child: const Text(
                                      'Blankezz',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.blue,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const TextSpan(
                              text:
                                  '. OW Fantasy LATAM is an unofficial fantasy league and has no affiliation with FaceIt, Blizzard, or any other parties.',
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      const Text(
                        '2. Data Usage',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'All stats are fetched from FaceIt. Blizzard and EFG are the sole owners of "Data and statistics relating to a participant’s play of Overwatch, and all feeds and data streams of such data and statistics." We use these stats within the guidelines set by Blizzard, as well as FaceIt\'s Developer Tool terms of service for use of its API. ',
                      ),
                      const Divider(),
                      const Text(
                        '3. Image Usage',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'All player images used are sourced from Liquipedia or FaceIt. If the subject or author wants to amend the image used or request removal, please contact us at: owfantasylatam@gmail.com.',
                      ),
                      const Divider(),
                      const Text(
                        '4. Contact',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'For any other questions, please contact us at: owfantasylatam@gmail.com.',
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

import 'package:flutter/material.dart';
import 'package:quran_app/helper/helper.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // App bar configuration
          ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Map<int, List<String>>>(
              future: DatabaseHelper.quranByPage(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final pageData = snapshot.data!;
                  return PageView.builder(
                    itemCount: pageData.length,
                    itemBuilder: (context, index) {
                      final pageNumber = pageData.keys.elementAt(index);
                      final ayaTexts = pageData[pageNumber]!;
                      String concatenatedText =
                          ayaTexts.asMap().entries.map((entry) {
                        return entry.key == 0 ? entry.value : ' ${entry.value}';
                      }).join();

                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontFamily: 'hafs',
                                ),
                                text: concatenatedText,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

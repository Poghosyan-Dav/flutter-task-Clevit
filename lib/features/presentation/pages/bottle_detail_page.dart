import 'package:flutter/material.dart';
import '../../domain/entities/bottle.dart';
import 'tabs/info_tab.dart';
import 'tabs/tasting_tab.dart';
import 'tabs/history_tab.dart';

class BottleDetailPage extends StatefulWidget {
  final Bottle bottle;

  const BottleDetailPage({super.key, required this.bottle});

  @override
  State<BottleDetailPage> createState() => _BottleDetailPageState();
}

class _BottleDetailPageState extends State<BottleDetailPage> {
  int selectedIndex = 0;

  final List<String> tabs = ['Info', 'Tasting Notes', 'History'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Main Content
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Hero bottle image
                  Hero(
                    tag: widget.bottle.id,
                    child: Image.network(
                      widget.bottle.imageUrl,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      widget.bottle.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Tabs
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: List.generate(tabs.length, (index) {
                        final isSelected = index == selectedIndex;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => selectedIndex = index),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.amber : Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  tabs[index],
                                  style: TextStyle(
                                    color: isSelected ? Colors.black : Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Selected Tab Content
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildTabContent(),
                  ),
                ],
              ),
            ),

            // Back Button
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),

            // Bottom CTA
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  // TODO: add to collection or other action
                },
                child: const Text('Add to my collection'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (selectedIndex) {
      case 0:
        return InfoTab(bottle: widget.bottle);
      case 1:
        return TastingTab(bottle: widget.bottle);
      case 2:
        return HistoryTab(bottle: widget.bottle);
      default:
        return const SizedBox.shrink();
    }
  }
}

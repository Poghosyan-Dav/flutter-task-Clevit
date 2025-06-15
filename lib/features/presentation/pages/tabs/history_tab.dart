import 'package:flutter/material.dart';
import '../../../domain/entities/bottle.dart';

class HistoryTab extends StatefulWidget {
  final Bottle bottle;

  const HistoryTab({super.key, required this.bottle});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> with AutomaticKeepAliveClientMixin {
  String selectedStyle = '';
  String selectedType = '';

  final List<String> styles = ['Highland', 'Islay', 'Lowland'];
  final List<String> bottleTypes = ['Type A', 'Type B', 'Type C', 'Type D'];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Style', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: styles.map((style) {
              final isSelected = style == selectedStyle;
              return GestureDetector(
                onTap: () => setState(() => selectedStyle = style),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.amber : Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? Colors.amber : Colors.grey,
                    ),
                  ),
                  child: Text(
                    style,
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          const Text('Type', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bottleTypes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final type = bottleTypes[index];
              final isSelected = type == selectedType;

              return GestureDetector(
                onTap: () => setState(() => selectedType = type),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.amber : Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: isSelected ? Colors.amber : Colors.grey),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    type,
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Handle saving here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Added to collection")),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              minimumSize: const Size.fromHeight(48),
            ),
            child: const Text('Add to my collection'),
          ),
        ],
      ),
    );
  }
}

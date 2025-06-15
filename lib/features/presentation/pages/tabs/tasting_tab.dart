import 'package:flutter/material.dart';
import '../../../domain/entities/bottle.dart';

class TastingTab extends StatefulWidget {
  final Bottle bottle;

  const TastingTab({super.key, required this.bottle});

  @override
  State<TastingTab> createState() => _TastingTabState();
}

class _TastingTabState extends State<TastingTab> with AutomaticKeepAliveClientMixin {
  final Map<String, double> tastingRatings = {
    'Nose': 0,
    'Palate': 0,
    'Finish': 0,
  };

  final TextEditingController notesController = TextEditingController();

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bottle Image
          Center(
            child: Image.network(
              widget.bottle.imageUrl,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),

          // Bottle title
          Center(
            child: Text(
              widget.bottle.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),

          // Tasting group ratings
          ...tastingRatings.keys.map((category) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Slider(
                  value: tastingRatings[category]!,
                  onChanged: (value) {
                    setState(() {
                      tastingRatings[category] = value;
                    });
                  },
                  min: 0,
                  max: 10,
                  divisions: 10,
                  label: tastingRatings[category]!.toStringAsFixed(1),
                  activeColor: Colors.amber,
                ),
                const SizedBox(height: 12),
              ],
            );
          }),

          const SizedBox(height: 16),

          // Notes input
          TextField(
            controller: notesController,
            maxLines: 4,
            decoration: InputDecoration(
              labelText: 'Your notes',
              filled: true,
              fillColor: Colors.grey.shade800,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle save tasting notes
                final notes = notesController.text;
                final ratings = tastingRatings;

                // You can handle submission logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tasting notes saved')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Add to collection'),
            ),
          ),
        ],
      ),
    );
  }
}

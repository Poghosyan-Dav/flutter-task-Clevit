import 'package:flutter/material.dart';
import '../../../domain/entities/bottle.dart';

class InfoTab extends StatefulWidget {
  final Bottle bottle;

  const InfoTab({super.key, required this.bottle});

  @override
  State<InfoTab> createState() => _InfoTabState();
}

class _InfoTabState extends State<InfoTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final infoItems = {
      'Distillery': widget.bottle.distillery,
      'Country': widget.bottle.country,
      'Type': widget.bottle.type,
      'Bottler': widget.bottle.bottler,
      'Cask': widget.bottle.cask,
      'ABV': widget.bottle.abv,
      'Age': widget.bottle.age,
    };

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

          // Title
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

          // Info Fields
          ...infoItems.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(entry.key,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      entry.value,
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          }),

          const SizedBox(height: 32),

          // Add to Collection Button
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                // You can implement adding logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added to collection')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              icon: const Icon(Icons.add),
              label: const Text('Add to Collection'),
            ),
          ),
        ],
      ),
    );
  }
}

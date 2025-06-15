import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PhotoShowingScreen extends StatelessWidget {
  final String imagePath;

  const PhotoShowingScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            onPressed: () => context.push('/welcome'),
          ),
        ],
      ),
      body: Column(
          children: [
      Expanded(
      child: Stack(
      children: [
          Center(
          child: Image.file(
          File(imagePath),
      fit: BoxFit.contain,
    ),
    ),
    Positioned(
    bottom: 20,
    right: 20,
    child: IconButton(
    icon: const Icon(Icons.delete, color: Colors.white, size: 30),
    onPressed: () => _deleteImage(context),
    ),
    ),
    ],
    ),
    ),
    // Ad banner placeholder
    Container(
    height: 50,
    color: Colors.grey[800],
    child: const Center(child: Text('Ad Banner', style: TextStyle(color: Colors.white))),
    )],
    ),
    );
  }

  void _deleteImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Photo'),
        content: const Text('Are you sure you want to delete this photo?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Delete the file
              File(imagePath).delete();
              context.pop(); // Close dialog
              context.pop(); // Go back to camera
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
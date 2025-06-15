import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  CameraController? _controller;
  int _currentCameraIndex = 0;
  Future<void>? _initializeControllerFuture;
  List<CameraDescription>? _cameras;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras ??= await availableCameras();
    if (_cameras!.isEmpty) return;

    final camera = _cameras![_currentCameraIndex];
    _controller = CameraController(camera, ResolutionPreset.high);
    _initializeControllerFuture = _controller?.initialize();

    if (mounted) setState(() {});
  }

  Future<void> _switchCamera() async {
    if (_cameras == null || _cameras!.length <= 1) return;

    setState(() => _currentCameraIndex = (_currentCameraIndex + 1) % _cameras!.length);
    await _controller?.dispose();
    await _initCamera();
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller?.takePicture();
      if (image == null || !mounted) return;

      context.push('/photo-showing', extra: image.path);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cameraswitch, color: Colors.white),
            onPressed: _switchCamera,
          ),
        ],
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                CameraPreview(_controller!),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: _takePicture,
                      child: const Icon(Icons.camera, color: Colors.black),
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
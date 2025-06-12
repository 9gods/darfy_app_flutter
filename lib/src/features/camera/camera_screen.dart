import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers.dart';

class CameraScreen extends ConsumerStatefulWidget {
  const CameraScreen({super.key});

  @override
  ConsumerState<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends ConsumerState<CameraScreen> {
  CameraController? _controller;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;
    _controller = CameraController(camera, ResolutionPreset.medium);
    await _controller!.initialize();
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized || _busy) {
      return;
    }
    setState(() => _busy = true);
    final picture = await _controller!.takePicture();
    if (!mounted) return;

    await showCupertinoModalPopup(
      context: context,
      builder: (_) => const CupertinoPopupSurface(
        child: SizedBox(
          height: 120,
          child: Center(child: CupertinoActivityIndicator()),
        ),
      ),
    );

    await ref.read(invoiceProvider.notifier).addFromPhoto(picture.path);
    if (!mounted) return;
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return const CupertinoPageScaffold(
        child: Center(child: CupertinoActivityIndicator()),
      );
    }

    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Positioned.fill(child: CameraPreview(_controller!)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: CupertinoButton(
                padding: const EdgeInsets.all(20),
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(40),
                onPressed: _takePicture,
                child: const Icon(CupertinoIcons.camera, size: 32),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

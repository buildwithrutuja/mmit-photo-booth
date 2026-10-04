import 'dart:io';

import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const PhotoBoothApp());
}

class PhotoBoothApp extends StatelessWidget {
  const PhotoBoothApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MMIT Photo Booth',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF2E7D0),
        useMaterial3: true,
        fontFamily: 'serif',
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _openCamera(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CameraScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Main content
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Team name
                    const Text(
                      'SHENOVA',
                      style: TextStyle(
                        color: Color(0xFF8B6F47),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Vintage camera icon
                    Container(
                      width: 105,
                      height: 75,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B2A24),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFF8B6F47),
                          width: 3,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFF2E7D0),
                              border: Border.all(
                                color: const Color(0xFF8B6F47),
                                width: 4,
                              ),
                            ),
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              size: 20,
                              color: Color(0xFF3B2A24),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 10,
                            child: Container(
                              width: 9,
                              height: 9,
                              decoration: const BoxDecoration(
                                color: Color(0xFF8E2F35),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // MMIT
                    const Text(
                      'MMIT',
                      style: TextStyle(
                        color: Color(0xFF3B2A24),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 6,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // PHOTO BOOTH
                    const Text(
                      'PHOTO BOOTH',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF3B2A24),
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Decorative line
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 45,
                          height: 1.5,
                          color: const Color(0xFF8B6F47),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '✦',
                            style: TextStyle(
                              color: Color(0xFF8E2F35),
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 1.5,
                          color: const Color(0xFF8B6F47),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // Tagline
                    const Text(
                      'CAPTURE THE MOMENT',
                      style: TextStyle(
                        color: Color(0xFF6B5145),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 3,
                      ),
                    ),

                    const SizedBox(height: 48),

                    // Start button
                    SizedBox(
                      width: 230,
                      height: 62,
                      child: ElevatedButton(
                        onPressed: () => _openCamera(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8E2F35),
                          foregroundColor: const Color(0xFFF8EEDB),
                          elevation: 5,
                          shadowColor: const Color(0x663B2A24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: Color(0xFF3B2A24),
                              width: 2,
                            ),
                          ),
                        ),
                        child: const Text(
                          'START',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 34),

                    // College text
                    const Text(
                      'EST. MMIT COLLEGE',
                      style: TextStyle(
                        color: Color(0xFF8B6F47),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Top film strip
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 24,
                color: const Color(0xFF3B2A24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    9,
                    (index) => Container(
                      width: 18,
                      height: 10,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2E7D0),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Bottom film strip
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 24,
                color: const Color(0xFF3B2A24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    9,
                    (index) => Container(
                      width: 18,
                      height: 10,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2E7D0),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// CAMERA SCREEN
// ============================================================

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;

  bool _isLoading = true;
  String? _errorMessage;

  int _currentPhoto = 0;
  int _countdown = 0;
  bool _isCapturing = false;

  final List<XFile> _photos = [];

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();

      if (cameras.isEmpty) {
        throw Exception('No camera was found on this device.');
      }

      // Select the FRONT camera.
      CameraDescription selectedCamera = cameras.first;

      for (final camera in cameras) {
        if (camera.lensDirection == CameraLensDirection.front) {
          selectedCamera = camera;
          break;
        }
      }

      final controller = CameraController(
        selectedCamera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      _controller = controller;

      await controller.initialize();

      if (!mounted) {
        return;
      }

      setState(() {
        _isLoading = false;
      });
    } on CameraException catch (e) {
      if (!mounted) {
        return;
      }

      setState(() {
        _isLoading = false;

        if (e.code == 'CameraAccessDenied') {
          _errorMessage = 'Camera permission was denied.';
        } else {
          _errorMessage = 'Unable to access the camera.';
        }
      });
    } catch (e) {
      if (!mounted) {
        return;
      }

      setState(() {
        _isLoading = false;
        _errorMessage = 'Unable to start the camera.';
      });
    }
  }

  Future<void> _startPhotoSequence() async {
    if (_controller == null ||
        !_controller!.value.isInitialized ||
        _isCapturing) {
      return;
    }

    setState(() {
      _isCapturing = true;
      _currentPhoto = 0;
      _countdown = 0;
      _photos.clear();
    });

    for (int photoNumber = 1; photoNumber <= 4; photoNumber++) {
      if (!mounted) return;

      setState(() {
        _currentPhoto = photoNumber;
      });

      // READY
      setState(() {
        _countdown = -1;
      });

      await Future.delayed(const Duration(seconds: 2));

      // 3 → 2 → 1
      for (int count = 3; count >= 1; count--) {
        if (!mounted) return;

        setState(() {
          _countdown = count;
        });

        await Future.delayed(const Duration(seconds: 1));
      }

      if (!mounted) return;

      setState(() {
        _countdown = 0;
      });

      try {
        final XFile photo = await _controller!.takePicture();
        _photos.add(photo);
      } on CameraException {
        if (!mounted) return;

        setState(() {
          _isCapturing = false;
          _countdown = 0;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unable to capture the photo.')),
        );

        return;
      }

      // Small pause before the next photo
      if (photoNumber < 4) {
        await Future.delayed(const Duration(milliseconds: 800));
      }
    }

    if (!mounted) return;

    setState(() {
      _isCapturing = false;
      _countdown = 0;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PhotoPreviewScreen(photos: List<XFile>.from(_photos)),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Camera is still initializing.
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(color: Color(0xFFF2E7D0)),
        ),
      );
    }

    // Camera failed.
    if (_errorMessage != null) {
      return Scaffold(
        backgroundColor: const Color(0xFF3B2A24),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.camera_alt_outlined,
                  color: Color(0xFFF2E7D0),
                  size: 64,
                ),
                const SizedBox(height: 24),
                Text(
                  _errorMessage!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFF2E7D0),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 28),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('BACK'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final controller = _controller!;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // ==================================================
            // LIVE FRONT CAMERA PREVIEW
            // ==================================================
            Positioned.fill(
              child: ClipRect(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: controller.value.previewSize!.height,
                    height: controller.value.previewSize!.width,
                    child: CameraPreview(controller),
                  ),
                ),
              ),
            ),

            // ==================================================
            // VINTAGE TOP BAR
            // ==================================================
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 65,
                color: const Color(0xCC3B2A24),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: _isCapturing
                          ? null
                          : () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFFF2E7D0),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'SHENOVA • MMIT',
                      style: TextStyle(
                        color: Color(0xFFF2E7D0),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
            ),

            // ==================================================
            // PHOTO NUMBER
            // ==================================================
            if (_isCapturing)
              Positioned(
                top: 85,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xCC3B2A24),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'PHOTO $_currentPhoto OF 4',
                      style: const TextStyle(
                        color: Color(0xFFF2E7D0),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ),

            // ==================================================
            // COUNTDOWN
            // ==================================================
            if (_countdown != 0)
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _countdown == -1 ? 'READY' : '$_countdown',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    if (_countdown == -1)
                      const Text(
                        'Get ready...',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          letterSpacing: 2,
                        ),
                      ),
                  ],
                ),
              ),

            // ==================================================
            // CAPTURE BUTTON
            // ==================================================
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: _isCapturing ? null : _startPhotoSequence,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _isCapturing ? 0.45 : 1.0,
                    child: Container(
                      width: 82,
                      height: 82,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFF2E7D0),
                        border: Border.all(
                          color: const Color(0xFF8B6F47),
                          width: 5,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.camera_alt_rounded,
                        color: Color(0xFF3B2A24),
                        size: 34,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// PHOTO PREVIEW SCREEN
// ============================================================

class PhotoPreviewScreen extends StatelessWidget {
  final List<XFile> photos;

  const PhotoPreviewScreen({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E7D0),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF3B2A24),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'YOUR PHOTOS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF3B2A24),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),

            const Text(
              'SHENOVA',
              style: TextStyle(
                color: Color(0xFF8B6F47),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),

            const SizedBox(height: 12),

            // Four photos
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 20),
                  itemCount: photos.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFF8B6F47),
                          width: 3,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x443B2A24),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(5),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.file(
                          File(photos[index].path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Bottom buttons
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF3B2A24),
                        side: const BorderSide(
                          color: Color(0xFF3B2A24),
                          width: 2,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'RETAKE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Film-strip generation will go here.
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8E2F35),
                        foregroundColor: const Color(0xFFF8EEDB),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'NEXT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

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
// PHOTO FILTER PROCESSOR
// ============================================================

enum PhotoFilter { original, vintage, blackAndWhite }

class FilterProcessor {
  static img.Image apply(img.Image original, PhotoFilter filter) {
    switch (filter) {
      case PhotoFilter.original:
        return original.clone();

      case PhotoFilter.vintage:
        return _applyVintage(original);

      case PhotoFilter.blackAndWhite:
        return _applyBlackAndWhite(original);
    }
  }

  static img.Image _applyVintage(img.Image image) {
    final source = image.clone();
    final result = image.clone();

    final int width = source.width;
    final int height = source.height;

    const int redShift = 4;
    const int blueShift = -4;

    // -----------------------------------------
    // VINTAGE IMAGE EFFECT
    // -----------------------------------------

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final center = source.getPixel(x, y);

        final redPixel = source.getPixelSafe(x + redShift, y);

        final bluePixel = source.getPixelSafe(x + blueShift, y);

        double r = redPixel.r.toDouble();
        double g = center.g.toDouble();
        double b = bluePixel.b.toDouble();

        // Fresh warm vintage color.
        r = r * 1.07 + 5;
        g = g * 1.015 + 1;
        b = b * 0.94;

        // Stronger contrast.
        r = ((r - 128) * 1.16) + 128;
        g = ((g - 128) * 1.13) + 128;
        b = ((b - 128) * 1.12) + 128;

        // Protect dark areas.
        if (r < 25) r += 4;
        if (g < 25) g += 4;
        if (b < 25) b += 5;

        // Slight highlight roll-off.
        if (r > 215) {
          r = 215 + (r - 215) * 0.45;
        }

        if (g > 215) {
          g = 215 + (g - 215) * 0.45;
        }

        if (b > 215) {
          b = 215 + (b - 215) * 0.45;
        }

        // Film grain.
        final int noise = ((x * 17 + y * 31 + x * y) % 25) - 12;

        r += noise;
        g += noise;
        b += noise;

        // Subtle vignette.
        final double dx = (x - width / 2) / (width / 2);

        final double dy = (y - height / 2) / (height / 2);

        final double distance = (dx * dx + dy * dy).clamp(0.0, 1.0);

        final double vignette = 1.0 - (distance * 0.18);

        r *= vignette;
        g *= vignette;
        b *= vignette;

        result.setPixelRgba(
          x,
          y,
          r.clamp(0, 255).toInt(),
          g.clamp(0, 255).toInt(),
          b.clamp(0, 255).toInt(),
          center.a.toInt(),
        );
      }
    }

    // -----------------------------------------
    // RETRO CAMERA FRAME TEST
    // -----------------------------------------

    final int frameHeight = (height * 0.12).round();

    final black = img.ColorRgb8(0, 0, 0);
    final white = img.ColorRgb8(255, 255, 255);

    // TOP BLACK BAR
    img.fillRect(
      result,
      x1: 0,
      y1: 0,
      x2: width - 1,
      y2: frameHeight,
      color: black,
    );

    // BOTTOM BLACK BAR
    img.fillRect(
      result,
      x1: 0,
      y1: height - frameHeight,
      x2: width - 1,
      y2: height - 1,
      color: black,
    );

    // LARGE ASCII TEXT
    img.drawString(
      result,
      'REC',
      font: img.arial48,
      x: 20,
      y: 20,
      color: white,
    );

    img.drawString(
      result,
      'HD 4K',
      font: img.arial48,
      x: width - 150,
      y: 20,
      color: white,
    );

    img.drawString(
      result,
      'ISO 200',
      font: img.arial48,
      x: 20,
      y: height - frameHeight + 20,
      color: white,
    );

    return result;
  }

  static img.Image _applyBlackAndWhite(img.Image image) {
    final result = image.clone();

    // Stronger monochrome contrast for an old-film appearance.
    img.grayscale(result);

    img.adjustColor(result, contrast: 1.18, brightness: 1.01);

    return result;
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
class PhotoPreviewScreen extends StatefulWidget {
  final List<XFile> photos;

  const PhotoPreviewScreen({super.key, required this.photos});

  @override
  State<PhotoPreviewScreen> createState() => _PhotoPreviewScreenState();
}

class _PhotoPreviewScreenState extends State<PhotoPreviewScreen> {
  PhotoFilter _selectedFilter = PhotoFilter.original;

  List<img.Image?> _filteredImages = [];
  bool _isProcessing = false;
  img.Image _createFilmStrip(List<img.Image> photos) {
    const int stripWidth = 900;

    // Film border
    const int borderWidth = 62;

    // Space between photos
    const int photoGap = 35;

    // Top and bottom breathing room
    const int topBottomMargin = 55;

    final int photoWidth = stripWidth - (borderWidth * 2);

    final List<img.Image> resizedPhotos = [];

    for (final photo in photos) {
      final int photoHeight = (photo.height * photoWidth / photo.width).round();

      resizedPhotos.add(
        img.copyResize(photo, width: photoWidth, height: photoHeight),
      );
    }

    final int totalPhotoHeight = resizedPhotos.fold(
      0,
      (sum, photo) => sum + photo.height,
    );

    final int totalGapHeight = photoGap * (resizedPhotos.length - 1);

    final int stripHeight =
        topBottomMargin * 2 + totalPhotoHeight + totalGapHeight;

    final result = img.Image(width: stripWidth, height: stripHeight);

    // ============================================================
    // FILM BACKGROUND
    // ============================================================

    final filmBlack = img.ColorRgb8(25, 22, 20);
    final paperCream = img.ColorRgb8(242, 231, 208);

    img.fill(result, color: filmBlack);

    // ============================================================
    // PHOTO AREA
    // ============================================================

    int currentY = topBottomMargin;

    for (final photo in resizedPhotos) {
      // Cream frame around each photo.
      img.fillRect(
        result,
        x1: borderWidth,
        y1: currentY,
        x2: stripWidth - borderWidth - 1,
        y2: currentY + photo.height - 1,
        color: paperCream,
      );

      // Place photo.
      img.compositeImage(result, photo, dstX: borderWidth, dstY: currentY);
      img.compositeImage(result, photo, dstX: borderWidth, dstY: currentY);

      // Thick black separator
      img.fillRect(
        result,
        x1: borderWidth,
        y1: currentY + photo.height,
        x2: stripWidth - borderWidth - 1,
        y2: currentY + photo.height + photoGap - 1,
        color: img.ColorRgb8(30, 25, 22),
      );

      currentY += photo.height + photoGap;
    }

    // ============================================================
    // FILM PERFORATIONS
    // ============================================================

    const int holeWidth = 38;
    const int holeHeight = 32;
    const int holeSpacing = 48;

    final int leftHoleX = 10;
    final int rightHoleX = stripWidth - holeWidth - 10;

    for (int y = 18; y < stripHeight - 18; y += holeSpacing) {
      final int bottomY = y + holeHeight;

      if (bottomY >= stripHeight - 12) {
        break;
      }

      // Left perforation
      img.fillRect(
        result,
        x1: leftHoleX,
        y1: y,
        x2: leftHoleX + holeWidth,
        y2: bottomY,
        color: paperCream,
      );

      // Right perforation
      img.fillRect(
        result,
        x1: rightHoleX,
        y1: y,
        x2: rightHoleX + holeWidth,
        y2: bottomY,
        color: paperCream,
      );
    }

    // ============================================================
    // OUTER VINTAGE BORDER
    // ============================================================

    img.drawRect(
      result,
      x1: 8,
      y1: 8,
      x2: stripWidth - 9,
      y2: stripHeight - 9,
      color: img.ColorRgb8(48, 34, 30),
      thickness: 5,
    );

    return result;
  }

  @override
  void initState() {
    super.initState();
    _filteredImages = List<img.Image?>.filled(widget.photos.length, null);
  }

  Future<void> _applyFilter(PhotoFilter filter) async {
    if (_isProcessing) return;

    setState(() {
      _selectedFilter = filter;
      _isProcessing = true;
    });

    try {
      final List<img.Image?> results = [];

      for (final photo in widget.photos) {
        final bytes = await File(photo.path).readAsBytes();
        final decoded = img.decodeImage(bytes);

        if (decoded == null) {
          results.add(null);
          continue;
        }

        final filtered = FilterProcessor.apply(decoded, filter);

        results.add(filtered);
      }

      if (!mounted) return;

      setState(() {
        _filteredImages = results;
        _isProcessing = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isProcessing = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to apply the filter.')),
      );
    }
  }

  String _filterName(PhotoFilter filter) {
    switch (filter) {
      case PhotoFilter.original:
        return 'ORIGINAL';
      case PhotoFilter.vintage:
        return 'VINTAGE';
      case PhotoFilter.blackAndWhite:
        return 'B&W';
    }
  }

  Widget _filterButton(PhotoFilter filter) {
    final bool selected = _selectedFilter == filter;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: OutlinedButton(
          onPressed: _isProcessing ? null : () => _applyFilter(filter),
          style: OutlinedButton.styleFrom(
            foregroundColor: selected
                ? const Color(0xFFF8EEDB)
                : const Color(0xFF3B2A24),
            backgroundColor: selected
                ? const Color(0xFF8E2F35)
                : Colors.transparent,
            side: BorderSide(
              color: selected
                  ? const Color(0xFF8E2F35)
                  : const Color(0xFF3B2A24),
              width: 2,
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          child: Text(
            _filterName(filter),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoto(int index) {
    final filteredImage = _filteredImages[index];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF8B6F47), width: 3),
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
        child: filteredImage != null
            ? Image.memory(
                Uint8List.fromList(img.encodeJpg(filteredImage)),
                fit: BoxFit.contain,
              )
            : Image.file(File(widget.photos[index].path), fit: BoxFit.cover),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E7D0),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                children: [
                  IconButton(
                    onPressed: _isProcessing
                        ? null
                        : () => Navigator.pop(context),
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

            const SizedBox(height: 4),

            // FILTER TITLE
            const Text(
              'CHOOSE YOUR LOOK',
              style: TextStyle(
                color: Color(0xFF8B6F47),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 10),

            // FILTER BUTTONS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _filterButton(PhotoFilter.original),
                  _filterButton(PhotoFilter.vintage),
                  _filterButton(PhotoFilter.blackAndWhite),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // PHOTOS
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: ListView.separated(
                      padding: const EdgeInsets.only(bottom: 20),
                      itemCount: widget.photos.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return _buildPhoto(index);
                      },
                    ),
                  ),

                  if (_isProcessing)
                    Container(
                      color: const Color(0x993B2A24),
                      child: const Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(color: Color(0xFFF2E7D0)),
                            SizedBox(height: 14),
                            Text(
                              'APPLYING FILTER...',
                              style: TextStyle(
                                color: Color(0xFFF2E7D0),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // BOTTOM BUTTONS
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _isProcessing
                          ? null
                          : () => Navigator.pop(context),
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
                      onPressed: _isProcessing
                          ? null
                          : () {
                              final validImages = _filteredImages
                                  .whereType<img.Image>()
                                  .toList();

                              if (validImages.length != 4) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Please select a filter first.',
                                    ),
                                  ),
                                );
                                return;
                              }

                              final filmStrip = _createFilmStrip(validImages);
                              debugPrint('🔥 NEW FILM STRIP FUNCTION CALLED');

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      FilmStripScreen(filmStrip: filmStrip),
                                ),
                              );
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

class FilmStripScreen extends StatelessWidget {
  final img.Image filmStrip;

  const FilmStripScreen({super.key, required this.filmStrip});

  @override
  Widget build(BuildContext context) {
    final imageBytes = Uint8List.fromList(
      img.encodeJpg(filmStrip, quality: 95),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF2E7D0),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
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
                      'YOUR FILM STRIP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF3B2A24),
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      ),
                    ),
                  ),

                  const SizedBox(width: 48),
                ],
              ),
            ),

            // FILM STRIP PREVIEW
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 10,
                  ),
                  child: Image.memory(imageBytes, fit: BoxFit.contain),
                ),
              ),
            ),

            // ACTION BUTTONS
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF3B2A24),
                        side: const BorderSide(
                          color: Color(0xFF3B2A24),
                          width: 2,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'BACK',
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('SAVE will be added next.'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8E2F35),
                        foregroundColor: const Color(0xFFF8EEDB),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'SAVE',
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

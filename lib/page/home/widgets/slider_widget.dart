import 'package:flutter/material.dart';
import 'package:flutter_application/bloc/slider/slider_cubit.dart';
import 'package:flutter_application/bloc/slider/slider_state.dart';
import 'package:flutter_application/core/constants/app_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Menghasilkan URL gambar yang valid.
  /// - Kalau sudah http/https, dipakai apa adanya.
  /// - Kalau hanya nama file, digabung dengan BASE_URL (tanpa double slash).
  String _resolveImageUrl(String? image) {
    if (image == null || image.trim().isEmpty) return '';

    final img = image.trim();

    if (img.startsWith('http://') || img.startsWith('https://')) {
      return Uri.encodeFull(img);
    }

    final base = AppConfig.BASE_URL.endsWith('/')
        ? AppConfig.BASE_URL.substring(0, AppConfig.BASE_URL.length - 1)
        : AppConfig.BASE_URL;

    final file = img.startsWith('/') ? img.substring(1) : img;

    return Uri.encodeFull('$base/storage/$file');
  }

  Widget _placeholder({IconData icon = Icons.image}) {
    return Container(
      color: Colors.grey.shade300,
      width: double.infinity,
      child: Center(child: Icon(icon)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, SliderState>(
      builder: (context, state) {
        if (state is SliderLoading) {
          return const SizedBox(
            height: 170,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is SliderError) {
          return SizedBox(
            height: 170,
            child: Center(child: Text(state.message)),
          );
        }

        if (state is SliderLoaded) {
          final sliders = state.sliders;
          if (sliders.isEmpty) {
            return const SizedBox(
              height: 170,
              child: Center(child: Text('No slider data')),
            );
          }

          return SizedBox(
            height: 170,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: sliders.length,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    final item = sliders[index];
                    final imageUrl = _resolveImageUrl(item.image);

                    // Log URL final supaya bisa dicek / dibuka di tab browser
                    debugPrint('SLIDER raw=${item.image} -> url=$imageUrl');

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: imageUrl.isEmpty
                            ? _placeholder()
                            : Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                                loadingBuilder: (context, child, progress) {
                                  if (progress == null) return child;
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                errorBuilder: (_, error, stackTrace) {
                                  debugPrint(
                                    'SLIDER IMAGE ERROR url=$imageUrl error=$error',
                                  );
                                  return _placeholder(
                                    icon: Icons.broken_image,
                                  );
                                },
                              ),
                      ),
                    );
                  },
                ),
                Positioned(
                  left: 24,
                  child: CircleAvatar(
                    backgroundColor: Colors.black45,
                    child: IconButton(
                      icon: const Icon(Icons.chevron_left, color: Colors.white),
                      onPressed: () {
                        final prev = _currentIndex > 0
                            ? _currentIndex - 1
                            : sliders.length - 1;
                        _pageController.animateToPage(
                          prev,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  right: 24,
                  child: CircleAvatar(
                    backgroundColor: Colors.black45,
                    child: IconButton(
                      icon:
                          const Icon(Icons.chevron_right, color: Colors.white),
                      onPressed: () {
                        final next = _currentIndex < sliders.length - 1
                            ? _currentIndex + 1
                            : 0;
                        _pageController.animateToPage(
                          next,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
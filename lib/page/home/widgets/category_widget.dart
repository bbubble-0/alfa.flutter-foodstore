import 'package:flutter/material.dart';
import 'package:flutter_application/bloc/category/category_cubit.dart';
import 'package:flutter_application/bloc/category/category_state.dart';
import 'package:flutter_application/core/constants/app_config.dart';
import 'package:flutter_application/resource/model/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryWidget extends StatelessWidget {
  final void Function(CategoryModel category)? onCategoryTap;

  const CategoryWidget({
    super.key,
    this.onCategoryTap,
  });

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const SizedBox(
            height: 85,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is CategoryError) {
          return SizedBox(
            height: 85,
            child: Center(child: Text(state.message)),
          );
        }

        if (state is CategoryLoaded) {
          final categories = state.categories;
          if (categories.isEmpty) {
            return const SizedBox(
              height: 85,
              child: Center(child: Text('No category data')),
            );
          }

          return SizedBox(
            height: 92,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final category = categories[index];
                final imageUrl = _resolveImageUrl(category.image);

                // Log URL final supaya bisa dicek / dibuka di tab browser
                debugPrint(
                  'CATEGORY raw=${category.image} -> url=$imageUrl',
                );

                return InkWell(
                  onTap: () => onCategoryTap?.call(category),
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: 76,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: imageUrl.isEmpty
                              ? const Icon(Icons.category)
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    imageUrl,
                                    width: 52,
                                    height: 52,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, progress) {
                                      if (progress == null) return child;
                                      return const Center(
                                        child: SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      );
                                    },
                                    errorBuilder: (_, error, stackTrace) {
                                      debugPrint(
                                        'CATEGORY IMAGE ERROR url=$imageUrl error=$error',
                                      );
                                      return const Center(
                                        child: Icon(Icons.category),
                                      );
                                    },
                                  ),
                                ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          category.name ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
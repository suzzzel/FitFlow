import 'dart:math';

import 'package:fitflow/features/search/domain/providers/current_page_search_provider.dart';
import 'package:fitflow/features/search/domain/providers/search_result_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadNewPageButton extends ConsumerWidget {
  const LoadNewPageButton({
    super.key,
    required this.bodyPartFilter,
    required this.equipmentFilter,
    required this.targetFilter,
    required this.tempRequest,
    required this.currenPageProv,
  });

  final String? bodyPartFilter;
  final String? equipmentFilter;
  final String? targetFilter;
  final String tempRequest;
  final int currenPageProv;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(99)),
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.primary,
          ], transform: const GradientRotation(pi / 2))),
      child: ElevatedButton(
        onPressed: () {
          if (bodyPartFilter != null ||
              equipmentFilter != null ||
              targetFilter != null) {
            ref
                .read(searchResultDomainProviderProvider.notifier)
                .newDownloadNextPage(
                    nameOfExercise: tempRequest,
                    prevPage: currenPageProv,
                    usingFilter: true,
                    bodyPartFilter: bodyPartFilter,
                    equipment: equipmentFilter,
                    targetMuscleFilter: targetFilter);
          } else {
            ref
                .read(searchResultDomainProviderProvider.notifier)
                .newDownloadNextPage(
                  nameOfExercise: tempRequest,
                  prevPage: currenPageProv,
                  usingFilter: false,
                );
          }
          ref.read(currentSearchPageProvider.notifier).state++;
        },
        style: ButtonStyle(
            elevation: const WidgetStatePropertyAll(0),
            fixedSize: WidgetStatePropertyAll(
                Size(MediaQuery.of(context).size.width, 60)),
            backgroundColor: const WidgetStatePropertyAll(Colors.transparent)),
        child: Text(
          'Загрузить еще',
          style: GoogleFonts.inter(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

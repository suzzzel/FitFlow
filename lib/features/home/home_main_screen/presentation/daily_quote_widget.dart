import 'package:fitflow/features/home/home_main_screen/domain/providers/home_quotes_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteNew extends ConsumerStatefulWidget {
  final List<String> tempQuote;
  const QuoteNew({super.key, required this.tempQuote});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuoteNewState();
}

class _QuoteNewState extends ConsumerState<QuoteNew> {
  @override
  void initState() {
    ref.read(homeQuotesDataProviderAsyncProvider.notifier).getQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerLeft,
      child: RichText(
          text: TextSpan(
              text: widget.tempQuote.isNotEmpty ? widget.tempQuote.first : '',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onPrimary),
              children: [
            TextSpan(
                text: widget.tempQuote.isNotEmpty ? widget.tempQuote.last : '',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.secondary))
          ])),
    );
  }
}

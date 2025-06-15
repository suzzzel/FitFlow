import 'dart:io';

import 'package:flutter/material.dart';

class ImageInTrain extends StatelessWidget {
  const ImageInTrain({
    super.key,
    required this.gifEx,
  });

  final File gifEx;

  @override
  Widget build(BuildContext context) {
    return gifEx.existsSync()
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(24),
                      image: DecorationImage(
                          image: FileImage(gifEx), fit: BoxFit.fill)),
                ),
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Theme.of(context)
                                .colorScheme
                                .primaryFixed
                                .withOpacity(0.6),
                            Theme.of(context)
                                .colorScheme
                                .secondaryFixed
                                .withOpacity(0.5),
                          ]),
                      borderRadius: BorderRadius.circular(24)),
                ),
              ],
            ),
          )
        : Image.asset('assets/home/gif_error.gif');
  }
}

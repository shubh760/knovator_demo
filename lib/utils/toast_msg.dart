import 'package:flutter/material.dart';
import 'package:knovator_assignment/cosnt/color_const.dart';
import 'package:knovator_assignment/utils/app_text.dart';

void showToast(BuildContext context, String message) {
  OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Center(
      child: Material(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white, // Background color and opacity
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 05.0),
          child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width *
                    0.5, // Limit width to 50% of screen width
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 5,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: Colors.green,
                    gradient:
                        const LinearGradient(colors: colors.gradientColor)),
                child: Container(
                  padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(-15),
                    color: Colors.white,
                  ),
                  child: AppText(
                    text: message, color: Colors.black, // Text style
                  ),
                ),
              )),
        ),
      ),
    ),
  );

  // Add the OverlayEntry to the Overlay
  Overlay.of(context).insert(overlayEntry);

  // Dismiss the toast after a delay (adjust duration as needed)
  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}

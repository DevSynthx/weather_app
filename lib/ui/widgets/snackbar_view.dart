import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class InternetSnackBar {
  static void showErrorSnackBar(BuildContext context,
      {required String message}) {
    showTopSnackBar(
      context,
      CustomSnackBar.error(
        message: "Connected to the internet",
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AppSnackBar {
  static void showErrorSnackBar(BuildContext context,
      {required String message}) {
    showTopSnackBar(
      context,
      CustomSnackBar.error(
        message: message,
      ),
    );
  }

  static void showSuccessSnackBar(BuildContext context,
      {required String message}) {
    showTopSnackBar(
      context,
      CustomSnackBar.success(
        message: message,
      ),
    );
  }

  static void showInfoSnackBar(BuildContext context,
      {required String message}) {
    showTopSnackBar(
      context,
      CustomSnackBar.info(
        message: message,
      ),
    );
  }
}

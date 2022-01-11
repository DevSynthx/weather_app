String bg() {
  var timeNow = DateTime.now().hour;
  print(timeNow);

  if (timeNow == 6) {
    return 'assets/images/sunrise.jpg';
  } else if ((timeNow > 6) && (timeNow <= 17)) {
    return 'assets/images/evening.jpg';
  } else if ((timeNow > 17) && (timeNow < 18)) {
    return 'assets/images/evening.jpg';
  } else {
    return 'assets/images/nigthy.jpg';
  }
}

Future<void> waitForSeconds(int second) async {
  return Future.delayed(Duration(seconds: second));
}
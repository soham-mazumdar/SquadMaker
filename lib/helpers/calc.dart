// class Calcutors {
(int, int, int) ageNow(DateTime dob) {
  final today = DateTime.now();
  final year = today.year - dob.year;
  final mth = today.month - dob.month;
  final days = today.day - dob.day;
  if (mth < 0) {
    return (year - 1, mth.abs(), days);

    /// negative month means it's still upcoming
  } else {
    return (year - 1, mth.abs(), days);
  }
}
// }

String getInitials(String name) => name.isNotEmpty
    ? name.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
    : '';

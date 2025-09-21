class TimeFormatter {
  static String formatSecondsToReadable(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    final parts = <String>[];

    if (hours > 0) {
      parts.add("$hours hr");
    }
    if (minutes > 0) {
      parts.add("$minutes m");
    }
    if (seconds > 0) {
      parts.add("$seconds s");
    }

    return parts.join(" ");
  }

  static String formatTimeLine(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    final totalSeconds = difference.inSeconds;

    if (totalSeconds < 60) {
      return "now";
    }

    final minutes = difference.inMinutes;
    if (minutes < 60) {
      return "$minutes min";
    }

    final hours = difference.inHours;
    if (hours < 24) {
      return "$hours hr";
    }

    final days = difference.inDays;
    if (days <= 31) {
      return "$days d";
    }

    final months = (days / 30).floor();
    if (months < 12) {
      return "$months month";
    }

    final years = (months / 12).floor();
    return "$years year";
  }
}

class Helper {
  static extractIdFromUrl(String url) {
    //https://www.youtube.com/watch?v=KSQEnxZId9Y
    String idAndStuff = url.replaceAll("https://www.youtube.com/watch?v=", "");
    //remove stuff
    return idAndStuff.split("&").first;
  }

  static String viewCountStr(String viewCount) {
    int viewC = int.parse(viewCount);
    if (viewC <= 999) {
      return "$viewC vues";
    } else if (viewC > 1000 && viewC <= 999999) {
      double divEnt = viewC / 1000;
      return "${divEnt.toInt()}k vues";
    } else if (viewC > 1000000 && viewC <= 9999999) {
      double divEnt = viewC / 1000000;
      return "${divEnt.toInt()}Mio vues";
    } else {
      double divEnt = viewC / 1000000000;
      return "${divEnt.toInt()}Mrd vues";
    }
  }

  static String dateConverterStr(String dateStr) {
    DateTime? publishDate = DateTime.tryParse(dateStr);
    if (publishDate != null) {
      DateTime actualDate = DateTime.now();
      Duration diff = actualDate.difference(publishDate);

      if (diff.inDays == 0) {
        return "il y a ${diff.inHours} H";
      } else if (diff.inDays > 1 && diff.inDays <= 30) {
        return "il y a ${diff.inDays} Jrs";
      } else if (publishDate.year == actualDate.year) {
        int diffMonth = actualDate.month - publishDate.month;
        return "il y a $diffMonth M";
      } else {
        int diffYear = actualDate.year - publishDate.year;
        return "il y a $diffYear an";
      }
    } else {
      return "Quelques secondes";
    }
  }

  static String formatDuration(String duration) {
    // print(duration);
    // Supprime les parties non nécessaires de la durée
    String cleanDuration = duration.replaceAll(RegExp(r'[PTY]'), '');

    // Sépare la durée en heures, minutes et secondes
    List<String> parts = cleanDuration.split(RegExp(r'[HMS]'));

    // Convertit les parties en entiers
    int hours = parts.length > 2 ? int.parse(parts[0]) : 0;
    int minutes = parts.length > 1 ? int.parse(parts[parts.length - 2]) : 0;
    int seconds =
        parts.isNotEmpty && parts.last != "" ? int.parse(parts.last) : 0;

    // Formatage de la durée
    String formattedDuration = "";
    if (hours == 0) {
      formattedDuration = "${_twoDigits(minutes)}:${_twoDigits(seconds)}";
    } else {
      formattedDuration = '${_twoDigits(hours)}:${_twoDigits(minutes)}';
    }
    // '${_twoDigits(hours)}:${_twoDigits(minutes)}:${_twoDigits(seconds)}';

    return formattedDuration;
  }

  static String _twoDigits(int n) {
    if (n >= 10) {
      return '$n';
    } else {
      return '0$n';
    }
  }
}

import 'package:intl/intl.dart';

String timeAgo(DateTime publishedDate) {
  Duration difference = DateTime.now().difference(publishedDate);

  if (difference.inSeconds < 60) {
    return '${difference.inSeconds} detik yang lalu';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} menit yang lalu';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} jam yang lalu';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} hari yang lalu';
  } else {
    return DateFormat('dd MMM yyyy, HH:mm').format(publishedDate);
  }
}

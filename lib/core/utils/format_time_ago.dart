String formatTimeAgo(DateTime dateTime) {
  final difference = DateTime.now().difference(dateTime);

  if (difference.inMinutes < 1) {
    return 'Just now';
  }
  if (difference.inMinutes < 60) {
    return '${difference.inMinutes} Mins ago';
  }
  if (difference.inHours < 24) {
    return '${difference.inHours} Hrs ago';
  }
  if (difference.inDays < 7) {
    return '${difference.inDays} Days ago';
  }

  return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
}

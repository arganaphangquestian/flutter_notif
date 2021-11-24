class NotificationModel {
  final String id;
  final String title;
  final String body;

  NotificationModel(this.id, this.title, this.body);

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body};
  }

  NotificationModel.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        title = data['title'],
        body = data['body'];
}

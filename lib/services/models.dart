class Monitor {
  String uid;

  Monitor({this.uid});

  factory Monitor.fromMap(Map data) {
    return Monitor(
      uid: data['uid'],
    );
  }
}

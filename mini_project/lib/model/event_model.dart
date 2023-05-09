class EventModel {
  final String eventName;
  final String eventDescription;
  final int eventDue;

  EventModel(
      {required this.eventName,
      required this.eventDescription,
      required this.eventDue});
}

List<EventModel> events = [
  EventModel(
      eventName: '2X POINTS',
      eventDescription: 'Gain multiple points by 2x',
      eventDue: 172800)
];

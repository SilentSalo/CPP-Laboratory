class Day {
	int visitorQuantity;
	String comment;

	Day(this.visitorQuantity, this.comment);

  int getVisitorQuantity() => visitorQuantity;
	String getComment() => comment;

	void setVisitorQuantity(int visitorQuantity) => this.visitorQuantity = visitorQuantity;
	void setComment(String comment) => this.comment = comment;
}

class Exhibition {
	String name;
	String artistSurname;
	List<Day> days = [];

	Exhibition(this.name, this.artistSurname);

	String getName() => name;
	String getArtistSurname() => artistSurname;
	List<Day> getDays() => days;

	void setName(String name) => this.name = name;
	void setArtistSurname(String artistSurname) => this.artistSurname = artistSurname;
	void addDay(Day day) => days.add(day);

	int getTotalVisitors() {
	  List<int> visitorQuantities = days.map((day) => day.getVisitorQuantity()).toList();

		return visitorQuantities.reduce((a, b) => a + b);
	}

	Day getDayWithLeastVisitors() {
		if (days.isEmpty) {
			throw Exception("No days available");
		}

		List<int> visitorQuantities = days.map((day) => day.getVisitorQuantity()).toList();
		int minVisitors = visitorQuantities.reduce((a, b) => a < b ? a : b);
		int minIndex = visitorQuantities.indexOf(minVisitors);

		return days[minIndex];
	}

	List<String> getCommentsWithKeyword(String keyword) {
		return days
			.where((day) => day.getComment().toLowerCase().contains(keyword.toLowerCase()))
      .map((day) => day.getComment())
			.toList();
	}
}

void main() {
	Exhibition exhibition = Exhibition("Modern Art", "Smith");

	exhibition.addDay(Day(150, "Great exhibition!"));
	exhibition.addDay(Day(200, "Loved the modern arts."));
	exhibition.addDay(Day(100, "Not my taste, but great effort."));
	exhibition.addDay(Day(250, "Amazing experience!"));

	print("Total visitors: ${exhibition.getTotalVisitors()}");

	Day leastVisitedDay = exhibition.getDayWithLeastVisitors();
	print("Day with least visitors: ${leastVisitedDay.getVisitorQuantity()} visitors, Comment: ${leastVisitedDay.getComment()}");

	List<String> commentsWithGreat = exhibition.getCommentsWithKeyword("Great");
	print("Comments with 'Great': $commentsWithGreat");
}
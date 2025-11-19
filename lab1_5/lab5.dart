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
            throw Exception("No days available.");
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

    // generic method 1) дозволяє мапити список days у список будь-якого типу T
    List<T> mapDays<T>(T Function(Day) mapper) {
        return days.map((day) => mapper(day)).toList();
    }

    // generic method 2) знаходить перший день, що відповідає предикату, і повертає відображене значення типу T
    T? findFirstWhereMapped<T>(bool Function(Day) predicate, T Function(Day) mapper) {
        for (var day in days) {
            if (predicate(day)) return mapper(day);
        }

        return null;
    }

    // generic method 3) статичний метод, що фільтрує список days за предикатом і конвертує у тип T
    static List<T> filterAndConvert<T>(List<Day> days, bool Function(Day) predicate, T Function(Day) converter) {
        return days.where(predicate).map(converter).toList();
    }
}

// generic class Box<T> дозволяє зберігати значення будь-якого типу T
class Box<T> {
    T value;
    Box(this.value);

    T get() => value;
    void set(T v) => value = v;

    // generic method 4) дозволяє мапити значення Box<T> у значення будь-якого типу R
    R map<R>(R Function(T) f) => f(value);
}

// функції, що повертають Future з використанням двох конструкторів
// 1) використання конструктора Future(() => ...)
Future<List<T>> futureMapDaysWithFuture<T>(Exhibition e, T Function(Day) mapper) {
  	return Future(() => e.mapDays(mapper));
}

// 2) використання конструктора Future.value(...)
Future<T?> futureFindFirstWhereMappedValue<T>(Exhibition e, bool Function(Day) predicate, T Function(Day) mapper) {
  	return Future.value(e.findFirstWhereMapped(predicate, mapper));
}

// демонстрація статичного методу через Future.delayed
Future<List<T>> futureFilterAndConvertValue<T>(List<Day> days, bool Function(Day) predicate, T Function(Day) converter) {
  	return Future.delayed(Duration(seconds: 3), () => Exhibition.filterAndConvert(days, predicate, converter));
}

// асинхронна функція, що послідовно викликає Future-функції з обробкою помилок
Future<void> runAsync(Exhibition e) async {
	try {
		var visitorList = await futureMapDaysWithFuture<int>(e, (d) => d.getVisitorQuantity());
		print('\nAsync visitor list: $visitorList');

		var busyComment = await futureFindFirstWhereMappedValue<String>(
			e, 
			(d) => d.getVisitorQuantity() > 180, 
			(d) => d.getComment()
		);

		if (busyComment == null) {
			print('No busy day found (> 180 visitors).');
		} else {
			print('Async found comment for busy day: $busyComment');
		}

		var upc = await futureFilterAndConvertValue<String>(
			e.getDays(), 
			(d) => d.getVisitorQuantity() < 250, 
			(d) => d.getComment().toUpperCase()
		);

		print('Async filtered uppercased comments: $upc');
	} catch (e) {
		print('Error during async sequence: $e');
	}
}

void main() async {
    Exhibition exhibition = Exhibition("Modern Art", "Smith");

    exhibition.addDay(Day(150, "Great exhibition!"));
    exhibition.addDay(Day(200, "Loved the modern arts."));
    exhibition.addDay(Day(100, "Not my taste, but great effort."));
    exhibition.addDay(Day(250, "Amazing experience!"));

    print("Total visitors: ${exhibition.getTotalVisitors()}");

    Day leastVisitedDay = exhibition.getDayWithLeastVisitors();
    print("Day with least visitors: ${leastVisitedDay.getVisitorQuantity()} visitors, Comment: ${leastVisitedDay.getComment()}");

    List<String> commentsWithGreat = exhibition.getCommentsWithKeyword("great");
    print("Comments with 'great': $commentsWithGreat");

  	// mapDays як generic method
    List<int> visitorList = exhibition.mapDays<int>((d) => d.getVisitorQuantity());
    print('Visitor list via generic mapDays: $visitorList');

    // findFirstWhereMapped як generic method
    String? commentForBusyDay = exhibition.findFirstWhereMapped<String>(
        (d) => d.getVisitorQuantity() > 180,
        (d) => d.getComment()
    );
    print('First comment from a busy day (> 180 visitors): $commentForBusyDay');

    // filterAndConvert як static generic method
    List<String> smallDayComments = Exhibition.filterAndConvert<String>(
        exhibition.getDays(),
        (d) => d.getVisitorQuantity() < 250,
        (d) => d.getComment().toUpperCase()
    );
    print('Uppercased comments for days with < 200 visitors: $smallDayComments');

    // generic class Box<T> використання і його generic method map<R>
    Box<Day> dayBox = Box<Day>(exhibition.getDayWithLeastVisitors());
    String daySummary = dayBox.map<String>((day) => 'Boxed day: ${day.getVisitorQuantity()} visitors - "${day.getComment()}"');
    print(daySummary);

  	// виклик асинхронної функції з обробкою помилок
  	await runAsync(exhibition);
}
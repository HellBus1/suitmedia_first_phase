# suitmedia_first_phase

## First submission
I create the app according to the flow, and here is a list of related files :
1. Home (location: lib/pages/home.dart)
2. Guest or event chooser (location: lib/pages/event_chooser.dart)
3. List / table view events (location: lib/pages/event_list.dart)
4. Grid / collection view guests (location: lib/pages/guest_list.dart)

## Second Submission
1. Question 1 (Palindrome Check)
My method is using dart's built in function to reverse original string as new variable and compare each other. I think this is not the best method (in term memory and time complexity) but it's simple enough to implement. Here is the piece of code :

Location lib/pages/home.dart (line 195 - 202)

```dart
  isPalindrome() {
    String inputtext = _controller.text;
    String buffer = _controller.text;
    String reversedinputtext =
        String.fromCharCodes(buffer.runes.toList().reversed);
    print(reversedinputtext);
    return inputtext == reversedinputtext;
  }
```

2. Question 2 (Determine is prime or not)
My method is using iteration from 2 until it's squareroot and do modulo to the question number and the iteration (we don't need to iterate all number until the question number). This method has O(n^1/2) time complexity. Here is the pice of code :

Location lib/pages/event_chooser.dart (line 177 - 193)

```dart
  primeChecker(value) {
    if (value <= 1) {
      return false;
    }

    if (value == 2) {
      return true;
    }

    for (int i = 2; i <= sqrt(value); i++) {
      if (value % i == 0) {
        return false;
      }
    }

    return true;
  }
```

3. Question 3
The important part are :
- Implement pull to refresh & cached data in guest list view
For the cached data approach, i use file for storing json, i fill it when there is connection and load it when there is no connection. Thanks to this article https://medium.com/flutter-community/cache-manager-with-flutter-5a5db0d3a3e6 i found how to easily cached data using file with no need worry about permission (it's called Application Directory Path) The library i use are below :

1. Flutter path provider
https://pub.dev/packages/path_provider

Here is the piece of code :

Location lib/provider/main_provider.dart (line 71 - 138)

```dart
  writeToFile(value) async {
    String _filePath = await filePath();
    File userDocumentFile = File(_filePath);
    userDocumentFile?.writeAsStringSync(value);
  }

  Future<Directory> documentsPath() async {
    String tempPath = (await getApplicationDocumentsDirectory())?.path;
    return Directory("$tempPath").create();
  }

  Future<String> filePath() async {
    final path = (await documentsPath()).path;
    return "$path/$fileName";
  }

  Future<bool> getFileReadAllData() async {
    ...
    try {
      String _filePath = await filePath();
      File userDocumentFile = File(_filePath);
      final data = await userDocumentFile?.readAsString();
      final jsonData = jsonDecode(data);

      if (jsonData != null) {
        makeDataList(jsonData);
        ...
  }

  makeDataList(data) {
    guestList.clear();
    data.forEach((data) {
      guestList.add(Guest.fromJson(data));
    });
  }

  Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      ...
  }
```

Second, the pull to refresh method implemented using below's library :

1. Flutter pull to refresh
https://pub.dev/packages/pull_to_refresh

Together with pull action, i force the screen to reload from initial state by pop and push current page. So the screen can check connection again and then decide wheter fetch from internet or cached file.

- Plus button in action button appbar showing list of event with it's location (showed in map) with dummy latlong  

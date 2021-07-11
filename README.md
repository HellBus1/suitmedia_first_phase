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

Location lib/pages/home.dart

```
  showAlertDialog(BuildContext context, provider) {
    // set up the button
    Widget okButton = TextButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop('dialog');
        },
        child: Text(
          "Close",
          style: TextStyle(color: Colors.blue),
        ));

    Widget checkButton = TextButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop('dialog');
          provider.setName(_controller.text);
          Navigator.pushNamed(context, '/event/choose');
        },
        child: Text(
          "Lanjut",
          style: TextStyle(color: Colors.blue),
        ));

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Peringatan", style: TextStyle(color: Colors.red)),
      content: Text((_controller.text != "")
          ? (isPalindrome() ? "Palindrom" : "Bukan Palindrom")
          : ("Nama tidak boleh kosong")),
      actions: [okButton, (_controller.text != "") ? checkButton : Container()],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  isPalindrome() {
    String inputtext = _controller.text;
    String buffer = _controller.text;
    String reversedinputtext =
        String.fromCharCodes(buffer.runes.toList().reversed);
    print(reversedinputtext);
    return inputtext == reversedinputtext;
  }
```

2. Question 2

3. Question 3

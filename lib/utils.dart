import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/bookmark.dart';

/// ************************************************
/// UTILS
///************************************************/
class NQUtils {
  ///  Utility method to display a snack bar with a message
  ///  Parameter:
  ///     context: the BuildContext
  ///     message: the message String to be displayed
  ///  Returns: Void
  static showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  ///  Utility method to hide the snackbar
  ///  Parameter:
  ///     context: the BuildContext
  ///  Returns: Void
  static hideSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  ///  Utility method to save a bookmark in preference
  ///  Parameter:
  ///     bookmark: the bookmark of type NQBookmark
  ///  Returns: Void
  static void saveBookmark(NQBookmark bookmark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("bookmark", json.encode(bookmark.toJson()));
  }

  ///  Utility method to fetch the saved bookmark
  ///  Parameter: Void
  ///  Returns: NQBookmark or null if there is no bookmark
  static Future<NQBookmark?> getBookmark() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? bookmarkJson = prefs.getString("bookmark") ?? null;
    if (bookmarkJson != null && bookmarkJson != "") {
      NQBookmark bookmark = NQBookmark.fromJson(json.decode(bookmarkJson));
      return bookmark;
    }
    return null;
  }

  /// Utility method to save a key and value to preferences
  /// Parameters:
  ///   key: The key as String
  ///   value: The value as String
  /// Returns: Void
  static void saveStringToPreferences(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  /// Utility method to fetch a saved preference
  /// Parameters:
  ///   key: The key as String
  /// Returns: the fetched value or null if there is no saved valye for the key
  static Future<String?> getStringFromPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? null;
  }

  /// Utility method to display a confirmation dialog with title and message
  /// Parameters:
  ///   context: The BuildContext
  ///   title: title as String
  ///   message: message as String
  ///   confirmButtonTitle: title of the confirmation button as String
  ///   onConfirmed: the callback function to be invoked when the confirmation button is tapped
  /// Returns: Void
  static showConfirmationDialog(BuildContext context, String title, String message,
      String confirmButtonTitle, Function onConfirmed) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                  child: Text(confirmButtonTitle),
                  onPressed: () {
                    onConfirmed();
                    Navigator.of(context).pop();
                  }),
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}

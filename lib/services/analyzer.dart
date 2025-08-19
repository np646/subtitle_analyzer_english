import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class Analyzer {
  final FilePickerResult subtitleFile;

  //Constructor
  Analyzer(this.subtitleFile);

  /*
 * analyze: recieves a FilePickerResult object, reads every line and cleans it from any unwanted characters.
 * Every subtitle file has the following format:
 * Index (ex. 1)
 * Timestamp (ex. 00:00:01,000 --> 00:00:05,000)
 * Text (ex. "Hello, world!")
 *
 * For that reason, the counter variable starts at 1, to skip the index and timestamp lines.
 * It resets back to 0 when an empty line is encountered.
 */
  Future<void> analyze() async {
    final path = subtitleFile.files.single.path;

    if (path != null) {
      final file = File(path);
      int counter = 1;

      await for (final line
          in file
              .openRead()
              .transform(utf8.decoder)
              .transform(const LineSplitter())) {
        if (counter >= 3 && line.trim().isNotEmpty) {
          print(cleanLine(line).toLowerCase() + "\n");
        } else if (line.trim().isEmpty) {
          counter = 0;
        }
        counter++;
      }
    }
  }

  /*
   * cleanLine: cleans the input string by removing HTML tags, special characters,
   * and numbers. It returns the cleaned string.
   */
  String cleanLine(String line) {
    // remove HTML tags
    String result = line.replaceAll(RegExp(r"<[^>]*>"), "");

    // remove special characters
    result = result.replaceAll(RegExp(r'[\[\]\(\);,.:?!\-\"|~♪]'), " ");

    // remove numbers
    result = result.replaceAll(RegExp(r"\d+"), "");
    return result;
  }
}

# About
The objective of this project is to create a Flutter application capable of analyzing an English subtitle file to categorize words based on their [CEFR (Common European Framework of Reference for Languages)](https://www.coe.int/en/web/common-european-framework-reference-languages/level-descriptions)  level, allowing users to later export the results as a CSV file.

## To do
- [x] Allow users to upload a subtitle file (.srt).
- [ ] Clean the contents of the subtitle file by removing timestamps and indices.
- [ ] Tokenize the file and convert each entry to lowercase.
- [ ] Match tokens with an internal dictionary to categorize them by CEFR level.
- [ ] Display the results to the user.

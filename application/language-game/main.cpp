#include <iostream>
#include <string>


using namespace std;

int main() {
    string lang, word;
    getline(cin, lang);
    getline(cin, word);

    char charMapping[255] = { 0, };

    auto wordIter = word.cbegin();

    for (int c = 0; c < lang.length(); c += 3) {
        char letter = lang[c];

        if (charMapping[letter] != charMapping[*wordIter]) {
            // this letter was already mentioned with different name
            cout << "no";
            return 0;
        }

        char current = *wordIter;
        charMapping[letter] = current;
        while (*wordIter++ == current && wordIter != word.end());
    }

    cout << (wordIter == word.end() ? "yes" : "no");

    return 0;
}
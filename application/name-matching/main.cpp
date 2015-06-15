#include <string>
#include <iostream>

using namespace std;

int main() {
	int maleCount = 0, femaleCount = 0;
	int knownMale, knownFemale;
	cin >> knownMale >> knownFemale;

	string name;
	while (cin >> name) {
		if (name.rfind("ss", name.length() - 2) != string::npos) {
			++maleCount;
		} else {
			++femaleCount;
		}
	}

	double malePercent = 1 / (maleCount - knownMale);
	double femalePercent = 1 / (femaleCount / knownFemale);

	double result = maleCount * femaleCount * 100.0;

	cout << (int)result << "%";

    return 0;
}
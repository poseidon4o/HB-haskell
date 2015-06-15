#include <string>
#include <iostream>
#include <algorithm>


using namespace std;

// assuming no name repetitions
// and random picking of a name

int fact(int x) {
	int result = 1;
	while (x > 1) {
		result *= x--;
	}
	return result;
}

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

	double malePercent = 1.0 / fact(maleCount - std::max(knownMale - 1, 1));
	double femalePercent = 1.0 / fact(femaleCount / std::max(knownFemale - 1, 1)) ;

	double result = malePercent * femalePercent * 100.0;

	cout << (int)result << "%";

    return 0;
}
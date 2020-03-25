#include <iostream>
#include <string>

using namespace std;

float price[4];

void printPrice() {
  cout << "CSY: " << price[0] << endl;
  cout << "LGX: " << price[1] << endl;
  cout << "HY: " << price[2] << endl;
  cout << "LDC: " << price[3] << endl;
}

int main() {
  string input;
  while (true) {
    cout << "Input price: " << endl;
    cin >> input;
    if (input == "end") {
      cout << "Final price" << endl;
      printPrice();
      break;
    }
    float current = stof(input);
    cout << "current price is: " << current << endl;
    cout << "Input people CSY(0) LGX(1) HY(2) LDC(3):" << endl;
    cin >> input;
    bool flag[4] = { false, false, false, false };
    int count = 0;
    for (char c : input) {
      flag[c - '0'] = true;
      count++;
    }
    // Input size = 0, consider all
    if (input.size() == 0) {
      for (int i = 0; i < 4; i++) flag[i] = true;
      count = 4;
    }
    for (int i = 0; i < 4; i++) {
      if (flag[i]) {
        price[i] += current / (float)count;
      }
    }
    printPrice();
  }
  return 0;
}
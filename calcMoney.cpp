#include <iostream>
#include <string>
#include <vector>

using namespace std;

struct Item {
  string name;
  int quantity;
  float price;
};

vector<Item> items[4];


void printPrice() {
  float price[4];
  cout << "CSY: " << price[0] << endl;
  cout << "LGX: " << price[1] << endl;
  cout << "HY: " << price[2] << endl;
  cout << "LDC: " << price[3] << endl;
}

int main() {
  string input;
  while (true) {
    cout << "Input price: " << endl;
    getline(cin, input);
    if (input == "end") {
      printPrice();
      break;
    }
    float current = stof(input);

    cout << "Input name; " << endl;
    getline(cin, input);
    string name = input;

    cout << "Input quantity: " << endl;
    getline(cin, input);
    int quantity = stoi(input);
    current *= quantity;

    cout << "Current price is: " << current << endl;

    cout << "Input people CSY(0) LGX(1) HY(2) LDC(3):" << endl;
    getline(cin, input);
    bool flag[4] = { false, false, false, false };
    int count = 0;
    
    if (input.size() == 0) {
      // Input size = 0, consider all
      for (int i = 0; i < 4; i++) flag[i] = true;
      count = 4;
    } else {
      for (char c : input) {
        flag[c - '0'] = true;
        count++;
      }
    }
    
    for (int i = 0; i < 4; i++) {
      if (flag[i]) {
        items[i].push_back({ name, quantity, current / (float)count });
      }
    }
    printPrice();
  }
  return 0;
}
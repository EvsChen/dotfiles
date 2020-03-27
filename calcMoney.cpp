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
string names[4] = { "CSY", "LGX", "HY", "LDC" };

void printPrice() {
  for (int i = 0; i < 4; i++) {
    cout << "Price for " << names[i] << " is " << endl;
    float price = 0.f;
    printf("%20s|%10s|%10s\n", "Name", "Quantity", "Price");
    for (const Item &item : items[i]) {
      printf("%20s|%10d|%10f\n", item.name.c_str(), item.quantity, item.price);
      price += item.price;
    }
    printf("\n");
    printf("Total price is %f\n", price);
    printf("\n");
  }
}

int main() {
  string input;
  while (true) {
    cout << "Input name " << endl;
    getline(cin, input);
    if (input == "end") {
      printPrice();
      break;
    }
    string name = input;

    cout << "Input price: " << endl;
    getline(cin, input);
    float current = stof(input);

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
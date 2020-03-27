#include <iostream>
#include <string>
#include <vector>
#include <fstream>

using namespace std;

struct Item {
  string name;
  int quantity;
  float price;
};

vector<Item> items[4];
string names[4] = { "CSY", "LGX", "HY", "LDC" };
string cacheName = "moneny_cache";

void printPrice() {
  for (int i = 0; i < 4; i++) {
    cout << "Price for " << names[i] << " is " << endl;
    float price = 0.f;
    printf("%40s|%10s|%8s\n", "Name", "Quantity", "Price");
    for (const Item &item : items[i]) {
      printf("%40s|%10d|%8f\n", item.name.c_str(), item.quantity, item.price);
      price += item.price;
    }
    printf("\n");
    printf("Total price is %f\n", price);
    printf("\n");
  }
}

void loadCache(ifstream &cache) {
  string line;
  while (getline(cache, line)) {
    int people = line[0] - '0';
    string name;
    int start = 2;
    for (int i = 2; i < line.size(); i++) {
      if (line[i] == '|') {
        start = i + 1;
        name = line.substr(2, i - 2);
        break;
      }
    }
    int quantity;
    for (int i = start; i < line.size(); i++) {
      
    }
  }
  printPrice();
}

void cacheItem(int people, const Item &item, ofstream &cache) {
  cache << people << "|" << item.name << "|" << item.quantity << "|" << item.price << endl;
}

int main() {
  ifstream cache(cacheName);
  if (cache.good()) {
    loadCache(cache);
    cache.close();    
  }
  ofstream ocache(cacheName);

  string input;
  while (true) {
    cout << "Input name " << endl;
    getline(cin, input);
    if (input == "end") {
      printPrice();
      remove(cacheName);
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
        Item item = { name, quantity, current / (float)count };
        cacheItem(i, item, ocache);
        items[i].push_back(item);
      }
    }
    printPrice();
  }
  return 0;
}
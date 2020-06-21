#include <iostream>
#include <string>
#include <vector>
#include <fstream>

using namespace std;

struct Item {
  Item(string s, float p) : name(s), price(p) {}
  string name;
  float price;
};

vector<Item> items[4];
string names[4] = { "CSY", "LGX", "HY", "LDC" };
string cacheName = "money_cache";

void printPrice() {
  for (int i = 0; i < 4; i++) {
    cout << "Price for " << names[i] << " is " << endl;
    float price = 0.f;
    printf("%40s|%8s\n", "Name", "Price");
    for (const Item &item : items[i]) {
      printf("%40s|%8f\n", item.name.c_str(), item.price);
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
        name = line.substr(2, i - 2);
        start = i + 1;
        break;
      }
    }
    float price = stof(line.substr(start, line.size() - start));
    items[people].push_back(Item(name, price));
  }
  printPrice();
}

void cacheItem(int people, const Item &item, ofstream &cache) {
  cache << people << "|" << item.name << "|" << item.price << endl;
}

int main() {
  ifstream cache(cacheName);
  if (cache.good()) {
    loadCache(cache);
    cache.close();    
  }
  ofstream ocache(cacheName, ofstream::app);

  string input;
  while (true) {
    cout << "Input name " << endl;
    getline(cin, input);
    if (input == "end") {
      printPrice();
      remove(cacheName.c_str());
      break;
    }
    string name = input;

    float current;
    while (true) {
      cout << "Input price: " << endl;
      getline(cin, input);
      try {
        current = stof(input);
        break;
      } catch(const std::exception &e) {
        cout << "Invalid price. Please try again!" << endl;
      }
    }

    bool flag[4] = { false, false, false, false };
    int count = 0;
    while (true) {
      cout << "Input people CSY(0) LGX(1) HY(2) LDC(3):" << endl;
      getline(cin, input);
      if (input.size() == 0) {
        // Input size = 0, consider all
        for (int i = 0; i < 4; i++) flag[i] = true;
        count = 4;
        break;
      } else {
        bool valid = true;
        for (char c : input) {
          if (c < '0' || c > '3') {
            valid = false;
          }
          flag[c - '0'] = true;
          count++;
        }
        if (valid) {
          break;
        }
        // reset
        cout << "Invalid people. Try again" << endl;
        count = 0;
        for (int i = 0; i < 4; i++) flag[i] = false;
      }
    }
    
    
    for (int i = 0; i < 4; i++) {
      if (flag[i]) {
        Item item = { name, current / (float)count };
        cacheItem(i, item, ocache);
        items[i].push_back(item);
      }
    }
  }
  return 0;
}
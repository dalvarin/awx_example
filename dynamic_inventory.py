import json

def main():
  inventory = {
    "all": {
      "hosts": ["host1.example.com", "host2.example.com"],
      "vars": {
        "ansible_user": "your_user"
      }
    }
  }
  print(json.dumps(inventory))

if __name__ == "__main__":
  main()

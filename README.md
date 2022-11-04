# custom_socket
 custom package from package socket_io_client

# Example

```dart
late IO.Socket socket;

@override
  void initState() {
    super.initState();
    socket = CustomSocket(
      url: "http://127.0.0.1:3000/",
      onConnect: (data) {
        print("Connected");
      },
      onDisconnect: (data) {
        print("Disconnected");
      },
      onMessage: (data) {
        print(data);
    }).initializeSocket();
  }
```

library custom_socket;

import 'package:socket_io_client/socket_io_client.dart' as IO;

class CustomSocket {
  String url;
  Function(dynamic) onConnect;
  Function(dynamic) onDisconnect;
  Function(dynamic) onMessage;

  CustomSocket({
    this.url = "https://realtime-socket.herokuapp.com/",
    required this.onConnect,
    required this.onDisconnect,
    required this.onMessage,
  });

  IO.Socket initializeSocket() {
    IO.Socket socket;
    socket = IO.io(url, <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": true,
    });

    socket.connect(); //connect the Socket.IO Client to the Server

    //SOCKET EVENTS
    // --> listening for connection
    socket.on('connect', onConnect);

    //listen for incoming messages from the Server.
    socket.on('message', onMessage);

    //listens when the client is disconnected from the Server
    socket.on('disconnect', onDisconnect);

    return socket;
  }
}

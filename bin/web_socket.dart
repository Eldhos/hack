import 'dart:io';

void handleWebSocket(WebSocket socket){
  print('Client connected!');
  socket.listen((String s) {
    print('Client sent: $s');
    socket.add('echo: $s');
  },
      onDone: () {
        print('Client disconnected');
      });
}
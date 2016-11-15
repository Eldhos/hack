import 'dart:io';
import 'dart:convert' show UTF8, JSON;
import 'dart:async';



Future main() async {
  var server = await HttpServer.bind("localhost", 4042);
  startWeb();
  print('Listening for requests on 4042.');
  await listenForRequests(server);
}

Future listenForRequests(HttpServer server) async {
  await for (HttpRequest request in server) {
    switch (request.method) {
      case 'POST':
        handlePost(request);
        break;
      case 'OPTIONS':
        handleOptions(request);
        break;
      default:
        defaultHandler(request);
        break;
    }
  }
  print('No more requests.');
}

Future handlePost(HttpRequest request) async {
  StringBuffer content = new StringBuffer();
  var req = await new HttpClient().post("localhost",8085,"/sabreprovideradapter/v2/search");
  req.headers.contentType = new ContentType("application", "xml", charset: "utf-8");
  print(request.contentLength);
  await for (var contents in request.transform(UTF8.decoder)) {
    content.write(contents);
  }
  var reqContent = content.toString();
  req.write(reqContent);
  HttpClientResponse response =  await req.close();
  StringBuffer responseContent = new StringBuffer();
  await for (var contents in response.transform(UTF8.decoder)) {
    responseContent.write(contents);
  }
responseContent.toString();
//  print(UTF8.decodeStream(response));
  addCorsHeaders(request.response);
  request.response
    ..write(responseContent.toString())
    ..close();


  try {

  } catch (e) {
    print('Request listen error: $e');
    return;
  }
}

void onDataLoaded(String content){
  print(content);
}
void handleOptions(HttpRequest request) {
  var response = request.response;
  addCorsHeaders(response);
  print('${request.method}: ${request.uri.path}');
  response
    ..statusCode = HttpStatus.NO_CONTENT
    ..close();
}

void addCorsHeaders(HttpResponse response) {
  response.headers.add('Access-Control-Allow-Origin', '*');
  response.headers.add('Access-Control-Allow-Methods', 'POST, OPTIONS');
  response.headers.add('Access-Control-Allow-Headers',
      'Origin, X-Requested-With, Content-Type, Accept');
}
void defaultHandler(HttpRequest request) {
  var response = request.response;
  addCorsHeaders(response);
  response
    ..statusCode = HttpStatus.NOT_FOUND
    ..write('Not found: ${request.method}, ${request.uri.path}')
    ..close();
}


Future startWeb() async{
  String root = Directory.current.path;
  print(root);
  Process
      .run('pub', ['serve'],workingDirectory: root,runInShell: true)
      .asStream().listen((process){
    stdout.write(process.stdout);
    print("hello");
  }

  );
}


//void main() {
//  String directory;
//
//  final int port = 5000;
//  final String address = "127.0.0.1";
//
//  HttpServer.bind(address, port)		    .then((HttpServer server){
//
//    server.listen((HttpRequest request) {
//      if(request.uri.path.contains("seach")){
//        print(UTF8.decodeStream(request));
//      }
//    });
//
//  });
//
//
//  directory = Directory.current.parent
//                .listSync()
//                .firstWhere((file) => file.path.contains("Sabre")).path;
//
//
//
//
//
//  print(directory);
//  Process
//      .run('git', ['reset','--hard','origin/master'],workingDirectory: directory,runInShell: true)
//      .asStream().listen((process){
//
//        stdout.write(process.stdout);
//        print("hello");
//  }

//  );



//  .then((result) {
//    // Get the exit code from the new process.
//    print(result.stdout);
//    stdout.write(result.stdout);
//    stdout.write("hwllo");
////    result.exitCode.then((exitCode) {
////      print('exit code: $exitCode');
////    });
//  });
//}
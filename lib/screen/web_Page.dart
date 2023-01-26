import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'globals.dart';

class Web_Page extends StatefulWidget {
  const Web_Page({Key? key}) : super(key: key);

  @override
  State<Web_Page> createState() => _Web_PageState();
}

class _Web_PageState extends State<Web_Page> {
  InAppWebViewController? inAppWebViewController;
  late PullToRefreshController pullToRefreshController;
  late List allBooks = [];

  @override
  void initState(){
    super.initState();
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(color: Colors.black),
      onRefresh: () async {
        await inAppWebViewController?.reload();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 35),
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: Uri.parse("${Global.currentWeb['url']}"),
                    ),
                    pullToRefreshController: pullToRefreshController,
                    onLoadStop: ((controller, url) async {
                      await pullToRefreshController.endRefreshing();
                    }),
                    onWebViewCreated: (controller) {
                      setState(() {
                        inAppWebViewController = controller;
                      });
                    },
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      Uri? uri = await inAppWebViewController?.getUrl();

                      String url = uri.toString();

                      allBooks.add(url);
                    },
                    child: Icon(
                      Icons.bookmark_border,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () async {
                      await inAppWebViewController?.loadUrl(
                        urlRequest: URLRequest(
                          url: Uri.parse("${Global.currentWeb['url']}"),
                        ),
                      );
                    },
                    icon: Icon(Icons.home),
                  ),
                  IconButton(
                    onPressed: () async {
                      await inAppWebViewController?.goBack();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  IconButton(
                    onPressed: () async {
                      await inAppWebViewController?.reload();
                    },
                    icon: Icon(Icons.refresh),
                  ),
                  IconButton(
                    onPressed: () async {
                      await inAppWebViewController?.goForward();
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return SingleChildScrollView(
                            child: AlertDialog(
                              title: Text('BookMarks'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: allBooks
                                    .map(
                                      (e) => GestureDetector(
                                    onTap: () async {
                                      Navigator.of(context).pop();
                                      await inAppWebViewController?.loadUrl(
                                        urlRequest: URLRequest(
                                          url: Uri.parse(e),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        alignment: Alignment.bottomRight,
                                        height: MediaQuery.of(context)
                                            .size
                                            .height /
                                            5,
                                        width: MediaQuery.of(context)
                                            .size
                                            .width *
                                            .6,
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage("assets/image/BEST-MOVIES.webp"),fit: BoxFit.cover
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(e,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                    .toList(),
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(dialogContext)
                                        .pop(); // Dismiss alert dialog
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.black,
                                    ),
                                  ),
                                  child: Text("Exit"),
                                ),
                              ],
                              backgroundColor: Color(0xffF7EFE5),
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.save_alt),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

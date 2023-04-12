class _MotionsPageState extends State<MotionsPage>
    with TickerProviderStateMixin {
    locator<DocumentService>()
        .getMotionsAndAnswers("Val")
        .then((value) => setState(() {
                documents!.sort((a, b) =>
                    a[0]!.document_name!.compareTo(b[0]!.document_name!));
                                  onPressed: () =>
                                      FocusScope.of(context).unfocus())
                        List<String> searchTerms = search
                            .toLowerCase()
                            .trim()
                            .split(new RegExp(r"\s+"));
                              return searchTerms.every((term) => document[0]!
                                  .document_name!
                                  .toLowerCase()
                                  .contains(term));
                            children: documents!
                                .map((document) => _generateDocumentTile(
                                    document[0]!,
                                    document.length > 1 ? document[1] : null))
                                .toList(),
  Widget _generateDocumentTile(
      ElectionDocument motion, ElectionDocument? motion_answer) {

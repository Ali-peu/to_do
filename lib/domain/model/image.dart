class ImageModel {
  final int id;
  final String? urlPath;
  final String? localPath;

  const ImageModel(
    this.urlPath,
    this.localPath,

    {
    required this.id
  });
}
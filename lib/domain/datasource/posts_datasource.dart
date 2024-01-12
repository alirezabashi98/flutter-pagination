abstract class IPostsDatasource{
  Future<List<String>> getPosts(int page,int limit);
}
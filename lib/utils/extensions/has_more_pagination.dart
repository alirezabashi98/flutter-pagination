extension HasMorePagination on int{
  bool hasMore(int limit){
    return limit > this;
  }
}
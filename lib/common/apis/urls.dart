class FoodUrls{

  static const _url = "https://restaurantdb-production.up.railway.app/food/";

  retrieveUrl(){
    return Uri.parse(_url);
  }

  retrieveFoodUrl(id){
    return Uri.parse("$_url/$id");
  }

  createUrl(){
    return Uri.parse("$_url/create/");
  }

  updateUrl(id){
    return Uri.parse("$_url/$id/update/");
  }

  deleteUrl(id){
    return Uri.parse("$_url/$id/delete/");
  }
}
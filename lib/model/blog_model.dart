
class BlogModel {
  BlogModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.subTitle,
    required this.slug,
    required this.description,
    required this.image,
    required this.date,
    required this.tags,
  });

  String id;
  String categoryId;
  String title;
  String subTitle;
  String slug;
  String description;
  String image;
  String date;
  String tags;

}

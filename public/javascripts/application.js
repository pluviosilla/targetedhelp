var activeCategoryId = "sick";
function fadeCategory(id,tabTag) {
  $("#"+activeCategoryId).fadeOut("fast",function() {
    $("#"+id).fadeIn("fast");
  });
  activeCategoryId = id;
  $(".selected-category").removeClass("selected-category").addClass("category");
  $(tabTag).removeClass("category").addClass("selected-category");
};
var activeTabId = "needs";
function fadeTab(id,tabTag) {
  $("#"+activeTabId).fadeOut("fast",function() {
    $("#"+id).fadeIn("fast");
  });
  activeTabId = id;
  $("li.blue").removeClass("blue");
  $(tabTag).addClass("blue");
};
function openRecommendation() {
  $("#recommend").fadeIn("fast");
}
function openBioField() {
    $("#custombiofield").fadeIn("fast");
}
function corners() {
  $('.corner').corner();
}
function reapplyJazz() {
    FontJazz.apply('h4', 'bluefont-small')
}
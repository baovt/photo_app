function remove_fields(link) {  
    $(link).prev("input[type=hidden]").val("1");  
    $(link).closest(".fields").hide();  
}  
  
function add_fields(link, association, content) {  
    var new_id = new Date().getTime();  
    var regexp = new RegExp("new_" + association, "g");  
    $(link).prev().append(content.replace(regexp, new_id));  
}

$(function() {  
  $('.personnel.standard-list').sortable({
    containment: '.personnel.standard-list',
    tolerance: 'pointer',
    update: function(event, ui) {
      sortorder = new Array();
      
      sortables = ui.item.parent().find('li');
      
      sortables.each(function(i, item) {
        sortorder.push($(item).attr('id').substr(10));
      });
      
      sortables.find("a").removeClass('first');
      sortables.first().find("a").addClass("first");
      
      $.post("/admin/personnel/sort", { 'personnel[]': sortorder });
    }
  });
  
  $('.campaigns.standard-list').sortable({
    containment: '.campaigns.standard-list',
    tolerance: 'pointer',
    update: function(event, ui) {
      sortorder = new Array();
      
      sortables = ui.item.parent().find('li');
      
      sortables.each(function(i, item) {
        sortorder.push($(item).attr('id').substr(9));
      });
      
      sortables.find("a").removeClass('first');
      sortables.first().find("a").addClass("first");
      
      $.post("/admin/campaigns/sort", { 'campaigns[]': sortorder });
    }
  });
  
});
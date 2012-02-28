// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//= require jquery
//= require jquery_ujs
//= require_self
//= require_tree .

//Paginação e Ordenação
$(function() {
  $("th a, .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
});

	$(function() {
		$( ".datepicker" ).datepicker();
	});

// helpers adicionar e remover campos
function remove_fields(_1){
$(_1).prev("input[type=hidden]").val("1");
$(_1).closest(".fields").hide();
};
function add_fields(_2,_3,_4){
var _5=new Date().getTime();
var _6=new RegExp("new_"+_3,"g");
$(_2).parent().before(_4.replace(_6,_5));
};



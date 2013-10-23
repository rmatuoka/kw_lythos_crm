function resize_layout()
{
  var size_of_header = $(".header").height();
	var size_of_footer = $(".footer").height();
	var height = $(window).height();
	var height_content = height - size_of_header
	
	//alert("altura da janela = " + height);
	//alert("altura do header = " + size_of_header);
	//alert("altura do footer = " + size_of_footer);
	//alert("altura do content =" + height_content);
	
	$(".main-content").css("height", "auto");
	$(".main-content").css("min-height", height_content);
	
	$(".container-menu").css("height", "auto");
	$(".container-menu").css("min-height", height_content);
	
	//$(".main-box").css("height", "auto");
	//$(".main-box").css("min-height", height_content - size_of_footer);
}

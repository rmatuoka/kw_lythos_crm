var total_items = 0;
var table = ""

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


function add_item_to_proposal(qtde, name, value)
{
  if(qtde != "" && qtde > "" && name != ""  && value != "" && value > 0 )
  {
     
    table += "<table class=\"table table-condensed\">"
    table += "<tbody>"
    table += "<tr>"
    table += "  <td>"+ qtde +"</td>"
    table += "  <td>"+ name +"</td>"
    table += "  <td> R$"+ value +"</td>"
    table += "  <td>"+ value * qtde+"</td>"
    table += "</tr>"
    table += "</tbody></table>"
    
    table += "<input type='hidden' name='proposals[items][item_"+ total_items +"][quantity]' value='"+ qtde +"' />"
    table += "<input type='hidden' name='proposals[items][item_"+ total_items +"][product]' value='"+ name +"' />"
    table += "<input type='hidden' name='proposals[items][item_"+ total_items +"][value]' value='"+ value +"' />"

    $("#items").html(table);
  
    total_items ++;
  }
  else
  {
    alert("Atenção! \n\n Preencha os campos corretamente.");
  }

  

  //alert(table);
}
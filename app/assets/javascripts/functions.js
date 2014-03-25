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
function Excluir(){
    var par = $(this).parent().parent(); //tr
    par.remove();
}

function add_item_to_proposal(qtde, name, value, show_tabela)
{ 
  alert(show_tabela); 
  if(qtde != "" && qtde > "" && name != ""  && value != "" && value > 0 )
  {	
	table= "";
    if (!show_tabela){ 
	    table += "<table class=\"table table-condensed\" id=\"table_itens_prod\">"
	    table += "	<tbody>"
	    table += "		<tr>"
	    table += "  		<td>"+ qtde +"</td>"
	    table += "  		<td>"+ name +"</td>"
	    table += "  		<td> R$"+ value +"</td>"
	    table += "  		<td>"+ value * qtde+"</td>"
	    table += "  		<td><a class=\"btn btn-default delet-item\">-</a></td>"		
	    table += "			<input type='hidden' name='proposals[items][item_"+ total_items +"][quantity]' value='"+ qtde +"' />"
	    table += "			<input type='hidden' name='proposals[items][item_"+ total_items +"][product]' value='"+ name +"' />"
	    table += "			<input type='hidden' name='proposals[items][item_"+ total_items +"][value]' value='"+ value +"' />"
	    table += "		</tr>"
	    table += "	</tbody>"
		table += "</table>"
	    $("#items").html(table);
		$(".delet-item").bind("click", Excluir); 
	}else{
	    table += "		<tr>"
	    table += "  		<td>"+ qtde +"</td>"
	    table += "  		<td>"+ name +"</td>"
	    table += "  		<td> R$"+ value +"</td>"
	    table += "  		<td>"+ value * qtde+"</td>"
	    table += "  		<td><a class=\"btn btn-default delet-item\">-</a></td>"	 	
	    table += "			<input type='hidden' name='proposals[items][item_"+ total_items +"][quantity]' value='"+ qtde +"' />"
	    table += "			<input type='hidden' name='proposals[items][item_"+ total_items +"][product]' value='"+ name +"' />"
	    table += "			<input type='hidden' name='proposals[items][item_"+ total_items +"][value]' value='"+ value +"' />"
	    table += "		</tr>"
		$("#table_itens_prod tbody").append(table);
		$(".delet-item").bind("click", Excluir);   		
	}  
    total_items ++;
  }
  else
  {
    alert("Atenção! \n\n Preencha os campos corretamente.");
  }
  //alert(table);
}

function CalculaMetragem()
{
  //Variaveis
  var largura = parseFloat($("#largura").val());
  var cumprimento = parseFloat($("#cumprimento").val());
  var inclinacao = parseInt($("#inclinacao").val());
  var produto = parseInt($("#produto").val());
  
  var area = 0;
  var fator = 0;
  var total_pecas = 0;
  
  //FATORES
  var fatores = [
      [30, 1.044], 
      [31, 1.047], 
      [32, 1.050], 
      [33, 1.053], 
      [34, 1.056], 
      [35, 1.059], 
      [36, 1.063], 
      [37, 1.066], 
      [38, 1.070], 
      [39, 1.073], 
      
      [40, 1.077],
      [41, 1.081],
      [42, 1.085],
      [43, 1.089],
      [44, 1.093],
      [45, 1.097],
      [46, 1.10],
      [47, 1.104],
      [48, 1.109],
      [49, 1.114],
      
      [50, 1.118],
      [51, 1.123],
      [52, 1.127],
      [53, 1.132],
      [54, 1.136],
      [55, 1.141],
      [56, 1.146],
      [57, 1.151],
      [58, 1.156],
      [59, 1.161],
      [60, 1.166]
      // etc..
  ];

  
  if (largura == NaN || cumprimento == NaN || inclinacao == NaN || produto == NaN){
    alert("Todos os campos são obrigatórios");
  }
  else
  {
    area = (largura * cumprimento);
    
    fatores.forEach(function(f) {
      //alert(f[1]);
      if (inclinacao == f[0])
      {
        fator = f[1]
      }
    });
    
    
    total_pecas = ((area * fator) * produto)
    total_pecas = total_pecas + (total_pecas * 0.05)
    
    $("#resultado").html(parseInt(total_pecas) + " peças");
  }
  
  
}
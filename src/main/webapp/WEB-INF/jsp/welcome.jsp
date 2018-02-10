<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html lang="es">
<head>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="title" content="Repositories">
	<meta name="description" content="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quisquam accusantium enim esse eos officiis sit officia">
	<meta name="keyword" content="Lorem ipsum, dolor sit amet, consectetur, adipisicing, elit, Quisquam, accusantium, enim, esse">

	<title>Repositories</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>


*{
	margin:0px;
	padding:0px;
	list-style: none;
	text-decoration: none;
	font-family: 'Ubunt', sans-serif;
}

ul, ol{
	padding:0px;
}

a:visited, a:link, a:focus, a:hover, a:active{
	list-style: none;
	text-decoration: none;
}


</style>

</head>

<body>


<div class="container-fluid well well-sm barraProductos">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 organizarProductos">
			  <div class="form-group">
			    <div class="col-md-12">
			      <input type="text" class="form-control" id="search" placeholder="Ingresa tu busqueda y presiona enter">
			    </div>
			  </div>	
			</div>
		</div>
	</div>
</div>


<!--=====================================
VITRINA DE PRODUCTOS EN CUADRÍCULA
======================================-->
<div class="container">
		<ul id="lista-productos">
		 <c:forEach var = "list" items = "${lists}">
			<!-- Producto 1 -->
			<li class="col-md-3 col-sm-6 col-xs-12">
				<!--===============================================-->
				<figure>
					<a href="#" class="pixelProducto">
						<img src="/img/accesorio04.jpg" class="img-responsive">
					</a>
				</figure>
				<!--===============================================-->
				<h4>					
					<small>
							${list.id}
					</small>			

				</h4>

				<!--===============================================-->
				
				<div>
					<h2><small>${list.name}</small></h2>
					<p><small>${list.description}</small></p>
				</div>

				<!--===============================================-->

				<div class="col-md-12 enlaces">
					<div class="btn-group pull-right">
						<button type="button" class="btn btn-default btn-xs deseos"  data-toggle="tooltip" title="Agregar a mi lista de deseos">
							<i class="fa fa-heart" aria-hidden="true"></i>
						</button>
						<a href="#" class="pixelProducto">
							<button type="button" class="btn btn-default btn-xs" data-toggle="tooltip" title="Ver producto">
								<i class="fa fa-eye" aria-hidden="true"></i>
							</button>	
						</a>
					</div>
				</div>
			</li>
</c:forEach>
		</ul>
 

<div class="col-lg-12 col-md-12 col-xs-12"><br/>
<button class="btn btn-default backColor pull-right" id="vermas">
	VER MÁS <span class="fa fa-chevron-right"></span>
</button>
</div>
</div>


<script>
$(document).ready(function () {
	$('#search').keydown(function (e){
	    if(e.keyCode == 13){
	        data = {"name":$("#search").val()}
	        var myJSON = JSON.stringify(data);
	        $.ajax({
	            type: "POST",
	            url: "search",
	            data: myJSON,
	            contentType: "application/json",
	            async: false,
	            success: function (data) {
	            	$("#lista-productos").empty();	                
	                var obj = jQuery.parseJSON( data );
	                if(obj.length == 0){
	                	$("#lista-productos").append(
	                	'<li><div class="col-md-12 alert alert-warning">No se encontraron datos</div></li>'		
	                	);
	                }
	                $.each(obj, function(i, obj) {
	                  	  var element = ' \
	                			<li class="col-md-3 col-sm-6 col-xs-12">\
	        				<figure>\
	        					<a href="#" class="pixelProducto">\
	        						<img src="/img/accesorio04.jpg" class="img-responsive">\
	        					</a>\
	        				</figure>\
	        				<h4><small>' + obj.id + '</small></h4>\
	        				<div>\
	        					<h2><small>'+obj.name +'</small></h2>\
	        					<p><small>'+obj.description +'</small></p>\
	        				</div>\
	        				<div class="col-md-12 enlaces">\
	        					<div class="btn-group pull-right">\
	        						<button type="button" class="btn btn-default btn-xs deseos"  data-toggle="tooltip" title="Agregar a mi lista de deseos">\
	        							<i class="fa fa-heart" aria-hidden="true"></i>\
	        						</button>\
	        						<a href="#" class="pixelProducto">\
	        							<button type="button" class="btn btn-default btn-xs" data-toggle="tooltip" title="Ver producto">\
	        								<i class="fa fa-eye" aria-hidden="true"></i>\
	        							</button>	\
	        						</a>\
	        					</div>\
	        				</div>\
	        			</li>'
	                  	$("#lista-productos").append(element);
	                });   
	            }
	        });
	    }
	})
	
    $("#vermas").click(function () {
        data = {"name":$("#search").val()}
        var myJSON = JSON.stringify(data);
        $.ajax({
            type: "GET",
            url: "more",
            //data: myJSON,
            contentType: "application/json",
            async: false,
            success: function (data) {
                //$("#response").html(data.d);
                var obj = jQuery.parseJSON( data );
                console.log(obj);

                $.each(obj, function(i, obj) {
                  	  var element = ' \
	              	  <li class="col-md-3 col-sm-6 col-xs-12">\
	      				<figure>\
	      					<a href="#" class="pixelProducto">\
	      						<img src="/img/accesorio04.jpg" class="img-responsive">\
	      					</a>\
	      				</figure>\
	      				<h4><small>' + obj.id + '</small></h4>\
	      				<div>\
	      					<h2><small>'+obj.name +'</small></h2>\
	      					<p><small>'+obj.description +'</small></p>\
	      				</div>\
	      				<div class="col-md-12 enlaces">\
	      					<div class="btn-group pull-right">\
	      						<button type="button" class="btn btn-default btn-xs deseos"  data-toggle="tooltip" title="Agregar a mi lista de deseos">\
	      							<i class="fa fa-heart" aria-hidden="true"></i>\
	      						</button>\
	      						<a href="#" class="pixelProducto">\
	      							<button type="button" class="btn btn-default btn-xs" data-toggle="tooltip" title="Ver producto">\
	      								<i class="fa fa-eye" aria-hidden="true"></i>\
	      							</button>	\
	      						</a>\
	      					</div>\
	      				</div>\
	      			</li>'
                	  $("#lista-productos").append(element);
                	});
            }
        });
    });
});

</script>

</body>
</html>
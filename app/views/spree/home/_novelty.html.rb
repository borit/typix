<div id="disco_col1">
	<h4>nouveautés</h4>
	<h3><%=discovery.name%></h3>
	<%=image_tag("#{discovery.property :brand}Little.png")%>	
</div>

<%=discovery_image(discovery, :itemprop => "image", :alt=>"découverte", :class=>"disco_img") %> 

<p><%=discovery.description%></p>
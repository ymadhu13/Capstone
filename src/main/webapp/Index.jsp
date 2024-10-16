<%@page import="cn.techtutorial.Connection.DbCon"%>
<%@page import="cn.techtutorial.Dao.ProductDao"%>
<%@page import="cn.techtutorial.Model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}

ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();

Object cartListObj = session.getAttribute("cart-list");
if (cartListObj instanceof ArrayList<?>) {
    @SuppressWarnings("unchecked")
    ArrayList<Cart> cart_list = (ArrayList<Cart>) cartListObj;
    request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
<%@include file="/Includes/Head.jsp"%>
<title>E-Commerce Cart</title>
<style>

</style>
</head>
<body>
	<%@include file="/Includes/Navbar.jsp"%>

	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100">
					<img class="card-img-top" src="product-image/<%=p.getImage() %>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						<h6 class="price">Price: $<%=p.getPrice() %></h6>
						<h6 class="category">Category: <%=p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a> <a
								class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else {
			System.out.println("There is no proucts");
			}
			%>

		</div>
	</div>
	<%@include file="/Includes/Footer.jsp"%>
</body>
</html>
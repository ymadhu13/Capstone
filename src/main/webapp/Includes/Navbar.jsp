<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="Index.jsp">E-Commerce Cart</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="Index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="Cart.jsp">Cart <span class="badge badge-danger">${cart_list.size()}</span> </a></li>
                <% 
                    if (session.getAttribute("auth") != null) { 
                %>
                    <li class="nav-item"><a class="nav-link" href="Orders.jsp">Orders</a></li>
                    <li class="nav-item"><a class="nav-link" href="Log-out">Logout</a></li>
                <% 
                    } else { 
                %>
                    <li class="nav-item"><a class="nav-link" href="Login.jsp">Login</a></li>
                     <li class="nav-item"><a class="nav-link" href="Login.jsp">Logout</a></li>
                    <li class="nav-item"><a class="nav-link" href="Login.jsp">AboutUs</a></li>
                                     
                <% 
                    } 
                %>
            </ul>
        </div>
    </div>
</nav>

package cn.techtutorial.Sevlet;

import java.io.IOException;	
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.techtutorial.Connection.DbCon;
import cn.techtutorial.Dao.*;
import cn.techtutorial.Model.*;

@WebServlet("/User-Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");

			UserDao udao = new UserDao(DbCon.getConnection());
			User user = udao.userLogin(email, password);
			if (user == null) {
				request.getSession().setAttribute("auth", user);
				System.out.print("user logged in");
				response.sendRedirect("Index.jsp");
			} else {
				System.out.print("there is no user");
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
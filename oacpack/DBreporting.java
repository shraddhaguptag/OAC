package oacpack;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;




/**
 * Servlet implementation class DBreporting
 */
@WebServlet("/DBreporting")
public class DBreporting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       int id;
       String photo;
       String ack;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBreporting() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try{
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			String app_no=request.getParameter("app_no");
			String roll_no=request.getParameter("roll_no");
			String rank=request.getParameter("rank");
			String course=request.getParameter("course");
			String name=request.getParameter("name");
			String f_name=request.getParameter("f_name");
			String m_name=request.getParameter("m_name");
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test");
			PreparedStatement psmt=con.prepareStatement("insert into oac_student values(?,?,?,?,?,?,?,?,?,?)");
			psmt.setInt(1, id);
			psmt.setString(2, app_no);
			psmt.setString(3, roll_no);
			psmt.setString(4, rank);
			psmt.setString(5, course);
			psmt.setString(6, name);
			psmt.setString(7, f_name);
			psmt.setString(8, m_name);
			psmt.setString(9, ack);
			psmt.setString(10, photo);

			int p=psmt.executeUpdate();
			if(p>0)
			{
				out.println("successfully registered");
			response.sendRedirect("criteria.jsp");
			}
			else
			{
				out.println("registeration failed");
				response.sendRedirect("home.jsp");
			}
				con.close();
			
			}catch(Exception e)
			{
				System.out.println(e);
			}

	}

	}



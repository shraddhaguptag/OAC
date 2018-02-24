package oacpack;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private final String UPLOAD_DIRECTORY = "D:\\OC PRO/OAC/WebContent/upload";
    int count=0;
    int id;
    String ack="pending";


	public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String app_no="";
		String roll_no="";
		String rank="";
		String course="";
		String candidate_name="";
		String f_name="";
		String m_name="";
		String photo="";
		 response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		 if(ServletFileUpload.isMultipartContent(request))
	        {
	        	try{
	        	Class.forName("com.mysql.jdbc.Driver");
	    		@SuppressWarnings("unchecked")
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
	                for(FileItem item : multiparts)
	                {
	                    if(!item.isFormField())
	                    {
	                    	  File f=new File(item.getName());
	  		               // path=f.getName();
	                    	  photo=f.getName();
								System.out.println("path="+photo);
	  		                String name=f.getName();
	  		                item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
	  		            }
							else if(item.isFormField())
							{
								if(item.getFieldName().equals("app_no"))
									app_no=item.getString();
								if(item.getFieldName().equals("roll_no"))
									roll_no=item.getString();
								if(item.getFieldName().equals("rank"))
									rank=item.getString();
								if(item.getFieldName().equals("course"))
									course=item.getString();
								if(item.getFieldName().equals("candidate_name"))
									candidate_name=item.getString();
								if(item.getFieldName().equals("f_name"))
									f_name=item.getString();
								if(item.getFieldName().equals("m_name"))
									m_name=item.getString();
							
							}
	  		          }
	                System.out.println("path1="+photo);
			          request.setAttribute("message", "File Uploaded Successfully");
			          
			          
			       }
	        	catch(Exception ex)
				{
		               request.setAttribute("message", "File Upload Failed due to " + ex);
		        }         
		}
        else
		 {
		    request.setAttribute("message","Sorry this Servlet only handles file upload request");
		 }
  	try{
  		Class.forName("com.mysql.jdbc.Driver");
  		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test");
  		PreparedStatement psmt=(PreparedStatement) con.prepareStatement("insert into oac_student values(?,?,?,?,?,?,?,?,?,?)");

  		psmt.setInt(1,id);
  		psmt.setString(2,app_no);
  		psmt.setString(3,roll_no);
  		psmt.setString(4,rank);
  		psmt.setString(5,course);
  		psmt.setString(6,candidate_name);
  		psmt.setString(7, f_name);
  		psmt.setString(8, m_name);
  		psmt.setString(9, ack);
  		psmt.setString(10,photo);
  		int r=psmt.executeUpdate();
  		if(r>0){
  			out.println("<h1>Welcome: "+candidate_name+"<h1>");
  		HttpSession session=request.getSession();
  		session.setAttribute("counseling_id", id);
		session.setAttribute("app_no", app_no);
		session.setAttribute("name", candidate_name);
		session.setAttribute("pic", photo);
	//	session.setAttribute("email", email);
		out.println("<a href='NewFile1.jsp'>wel</a>");
  		}
  		else
  			System.out.println("no");
  		
  	}catch(Exception ex)
  	{
  		System.out.println(ex);
  	}
		// out.println("hello.............."+fname+" "+lname+""+msg+""+path);
		//request.getRequestDispatcher("/SessionServlet.java").forward(request, response);
	}

		
		
		
		
		
		
		}



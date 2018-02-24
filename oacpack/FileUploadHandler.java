package oacpack;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.mysql.jdbc.PreparedStatement;

public class FileUploadHandler extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "D:\\OC PRO/OAC/WebContent/upload";
    int count=0;
    int id;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException
    { 
    	String app_no="";
    	String roll_no="";
    	String course="";
    	String rank="";
    	String name="";
    	String f_name="";
    	String m_name="";
    	String photo="";
    	//String ack="";
    	
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
  		                photo=f.getName();
							System.out.println("photo="+photo);
  		                String photo_name=f.getName();
  		                item.write( new File(UPLOAD_DIRECTORY + File.separator + photo_name));
  		            }
						else if(item.isFormField())
						{
							if(item.getFieldName().equals("app_no"))
								app_no=item.getString("app_no");
							if(item.getFieldName().equals("roll_no"))
								roll_no=item.getString("roll_no");
							if(item.getFieldName().equals("rank"))
								rank=item.getString();
							if(item.getFieldName().equals("course"))
								course=item.getString();
							if(item.getFieldName().equals("student_name"))
								name=item.getString();
							if(item.getFieldName().equals("rank"))
								rank=item.getString();
							if(item.getFieldName().equals("f_name"))
								f_name=item.getString();
							if(item.getFieldName().equals("m_name"))
								m_name=item.getString();
						
						
						
						}
  		          }
                //System.out.println("photo="+photo);
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
  		PreparedStatement psmt=(PreparedStatement) con.prepareStatement("insert into oac_students (app_no,roll_no,rank,course,candidate_name,f_name,m_name,photo)values(?,?,?,?,?,?,?,?)");
  		
  		//psmt.setInt(1,id);
  		psmt.setString(1,app_no);
  		psmt.setString(2,roll_no);
  		psmt.setString(3,rank);
  		psmt.setString(4,course);
  		psmt.setString(5,name);
  		psmt.setString(6,f_name);
  		psmt.setString(7,m_name);
  		psmt.setString(8,photo);
  	//	psmt.setString(10,ack);
  		
  		
  		int r=psmt.executeUpdate();
  		if(r>0)
  			System.out.println("done");
  		else
  			System.out.println("no");
  		
  	}catch(Exception ex)
  	{
  		System.out.println(ex);
  	}

		request.getRequestDispatcher("/welcome.jsp").forward(request, response);
	}
}


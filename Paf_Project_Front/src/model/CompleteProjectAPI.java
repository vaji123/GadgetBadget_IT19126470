package model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap; 
import java.util.Map; 
import java.util.Scanner;


/**
 * Servlet implementation class ItemsAPI
 */
@WebServlet("/CompleteProjectAPI")
public class CompleteProjectAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	CompleteProject project = new CompleteProject();

    /**
     * Default constructor. 
     */
    public CompleteProjectAPI() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		String output = project.insertCompleteProjects(
				request.getParameter("rid"), 
				request.getParameter("proj_code"), 
				request.getParameter("proj_name"), 
				request.getParameter("proj_desc"),
				request.getParameter("skills_required"), 
				request.getParameter("payment_method"), 
				request.getParameter("estimate_budget")); 
				response.getWriter().write(output);	
				System.out.println("Got insert");		
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Got here");
		Map paras = getParasMap(request); 
		 String output = project.updateCompleteProjects(
		paras.get("hidItemIDSave").toString(), 
		paras.get("rid").toString(), 
		paras.get("proj_code").toString(), 
		paras.get("proj_name").toString(), 
		paras.get("proj_desc").toString(),
		paras.get("skills_required").toString(), 
		paras.get("payment_method").toString(), 
		paras.get("estimate_budget").toString()); 
		response.getWriter().write(output); 
		System.out.println("Got update");
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map paras = getParasMap(request); 
		 String output = project.deleteCompleteProjects(paras.get("proj_id").toString()); 
		response.getWriter().write(output); 
		System.out.println("Got delete");
	}
	
	// Convert request parameters to a Map
	private static Map getParasMap(HttpServletRequest request) 
	{ 
	 Map<String, String> map = new HashMap<String, String>(); 
	try
	 { 
	 Scanner scanner = new Scanner(request.getInputStream(), "UTF-8"); 
	 String queryString = scanner.hasNext() ? 
	 scanner.useDelimiter("\\A").next() : ""; 
	 scanner.close(); 
	 String[] params = queryString.split("&"); 
	 for (String param : params) 
	 { 
	String[] p = param.split("=");
	 map.put(p[0], p[1]); 
	 } 
	 } 
	catch (Exception e) 
	 { 
	 } 
	return map; 
	}


}

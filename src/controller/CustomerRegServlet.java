package controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Customer;
import model.bo.CustomerBO;

/**
 * Servlet implementation class CustomerRegServlet
 */
public class CustomerRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerRegServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				request.setCharacterEncoding("UTF-8");
				HttpSession session = request.getSession();
				String userName = request.getParameter("userName");
				String email = request.getParameter("email");
				CustomerBO kh = new CustomerBO();
				if(kh.checkUserName(userName)==true) {
					if(kh.checkEmail(email)==true) {
					String acc[] = new String[5];
					acc[0] = request.getParameter("userName");
					acc[1] = request.getParameter("password");
					acc[3] = request.getParameter("email");
					acc[4] = request.getParameter("showName");
					acc[2] = request.getParameter("repassword");
					//	Sao chﾃｩp l蘯｡i m蘯｣ng set value khi load trang n蘯ｿu x蘯｣y ra l盻擁
					String[] move = Arrays.copyOf(acc, 5);
					//	G盻絞 hﾃm ki盻ノ tra l盻擁 
					Validator(acc);
					int count = 0;
					for (int i = 0; i < acc.length; i++) {
						if(!acc[i].equals("")) {
							session.setAttribute("acc"+i, acc[i]);
							count++;
						}
					} 
					if(count == 0) {
						//X盻ｭ lﾃｽ thﾃｪm tﾃi kho蘯｣n m盻嬖 
						String insert = request.getParameter("submit");					
						//String userName1 = request.getParameter("userName");
						String password = request.getParameter("password");
						//String email = request.getParameter("email");		
						String showName = request.getParameter("showName");
						
						int type = 0;
						String avatar = request.getParameter("avatar");
						String mes = "";
						if (insert != null) {
							Customer dk = new Customer(userName, password, email, showName, avatar, type);
								try {
									kh.insertCustomer(dk);
									// N蘯ｿu thﾃｪm thﾃnh cﾃｴng tﾃi kho蘯｣n m盻嬖 tr蘯｣ v盻・login
									mes = "ﾄ斉ハg kﾃｽ thﾃnh cﾃｴng tﾃi kho蘯｣n m盻嬖. Vui lﾃｲng ﾄ惰ハg nh蘯ｭp."; 
									session.setAttribute("SingupSuccess", mes);  
									response.sendRedirect("CustomerLoginServlet");
								} catch (SQLException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
								//response.sendRedirect("index.jsp");
						}
						else {
							mes = "L盻擁 phﾃ｡t sinh t盻ｫ h盻・th盻創g, vui lﾃｲng quay l蘯｡i sau."; 
							session.setAttribute("SingupError", mes); 
							response.sendRedirect("pages/register.jsp");
						} 
						 
					}
					else {
						session.setAttribute("move", move);
						response.sendRedirect("pages/register.jsp");
					}
				}
				}
				else {
					// N蘯ｿu t盻渡 t蘯｡i email ho蘯ｷc tﾃi kho蘯｣n thﾃｬ nﾃｩm ra 1 session
					String mes = "Tﾃi kho蘯｣n ho蘯ｷc email ﾄ妥｣ t盻渡 t蘯｡i!"; 
					session.setAttribute("AcccExists", mes);  
					response.sendRedirect("pages/register.jsp");
				}  

				/*CustomerBO dkbo = new CustomerBO();
				String insert = request.getParameter("submit");
				
				String userName = request.getParameter("userName");
				String password = request.getParameter("password");
				String email = request.getParameter("email");		
				String showName = request.getParameter("showName");
				
				int type = 0;
				String avatar = request.getParameter("avatar");
				
				if (insert != null) {
					Customer dk = new Customer(userName, password, email, showName, avatar, type);
						try {
							dkbo.insertCustomer(dk);
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						response.sendRedirect("index.jsp");
				}*/				
	}
	//Ki盻ノ tra l盻擁
		private String[] Validator(String acc[]) { 
			//	Ki盻ノ tra tﾃｪn tﾃi kho蘯｣n
			Pattern pattern; 
			final String USERNAME_PATTERN = "^[A-Za-z0-9_]{3,20}$"; 
			final String PASSWORD_PATTERN = "^[A-Za-z0-9]{3,30}$";  
			final String VIEWNAME_PATTERN = ".{3,20}";  
			//	Ki盻ノ tra tﾃｪn tﾃi kho蘯｣n
			pattern = Pattern.compile(USERNAME_PATTERN);
			if(pattern.matcher(acc[0]).matches()) {
				acc[0] = "";
			}
			else {
				acc[0] = "Tﾃi kho蘯｣n t盻ｫ 3 ﾄ黛ｺｿn 20 kﾃｭ t盻ｱ vﾃ khﾃｴng ch盻ｩa kﾃｭ t盻ｱ ﾄ黛ｺｷt bi盻㏄";
			}
			// Ki盻ノ tra trﾃｹng m蘯ｭt kh蘯ｩu 
			if(acc[1].equals(acc[2])) {
				acc[2] = "";
			}
			else {
				acc[2] = "M蘯ｭt kh蘯ｩu chﾆｰa kh盻孅";
			}
			//	Ki盻ノ tra m蘯ｭt kh蘯ｩu
			pattern = Pattern.compile(PASSWORD_PATTERN);
			if(pattern.matcher(acc[1]).matches()) {
				acc[1] = "";
			}
			else {
				acc[1] = "M蘯ｭt kh蘯ｩu t盻ｫ 3 ﾄ黛ｺｿn 30 kﾃｭ t盻ｱ bao g盻杜 ch盻ｯ vﾃ s盻・";
			} 
			//	Ki盻ノ tra tﾃｪn hi盻ハ th盻・
			pattern = Pattern.compile(VIEWNAME_PATTERN);
			if(pattern.matcher(acc[4]).matches()) {
				acc[4] = "";
			}
			else {
				acc[4] = "Tﾃｪn hi盻ハ th盻・t盻ｫ 3 ﾄ黛ｺｿn 20 kﾃｭ t盻ｱ";
			}
			// Xﾃｩt l蘯｡i giﾃ｡ tr盻・l盻擁 email
			acc[3] = "";
			return acc;
		}

		// Code mﾃ｣ hﾃｳa m蘯ｭt kh蘯ｩu
		public static String encryption(String str) {
			byte[] defaultBytes = str.getBytes();
			try {
				MessageDigest algorithm = MessageDigest.getInstance("MD5");
				algorithm.reset();
				algorithm.update(defaultBytes);
				byte messageDigest[] = algorithm.digest();
				StringBuffer hexString = new StringBuffer();
				for (int i = 0; i < messageDigest.length; i++) {
					String hex = Integer.toHexString(0xFF & messageDigest[i]);
					if (hex.length() == 1) {
						hexString.append('0');
					}
					hexString.append(hex);
				}
				str = hexString + "";
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			return str;
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package assignment3;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class Test
 */
@WebServlet("/getPart3")
public class getPart3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public getPart3() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		if ((keyword == null) || (keyword.length() == 0)) 
		{
			request.getRequestDispatcher("indexPart3.jsp").forward(request, response);
		} else
		{
		// TODO Auto-generated method stub
		CloseableHttpClient httpclient = HttpClients.createDefault();
		try {
			String uri = ("http://api.nytimes.com/svc/search/v2/articlesearch.json");
			uri+="?q="+request.getParameter("keyword");
			HttpGet httpGet = new HttpGet(uri);
			CloseableHttpResponse response1 = httpclient.execute(httpGet);
			try {
				System.out.println(response1.getStatusLine());
				HttpEntity entity1 = response1.getEntity();
				String jsonText = EntityUtils.toString(entity1, "UTF-8");
				JSONObject json = new JSONObject(jsonText);
				System.out.println(jsonText);
				// do something useful with the response body
				// and ensure it is fully consumed
				EntityUtils.consume(entity1);
				JSONObject response11 = json.getJSONObject("response");
				JSONArray docs = response11.getJSONArray("docs");
				
				// get url
				for (int i = 0; i < docs.length(); i++) {
					JSONObject web_url = (JSONObject) docs.get(i);
					String url = (String) web_url.get("web_url");
					System.out.println(url);
					request.setAttribute(("url"+i), url);
				}
				
				// get title
				for (int i = 0; i < docs.length(); i++) {
					JSONObject docsObj = (JSONObject) docs.get(i);
					JSONObject headline = (JSONObject) docsObj.get("headline");
					String title = (String) headline.get("main");
					System.out.println(title);	
					request.setAttribute(("title"+i), title);
				}

				
				// get snippet
				for (int i = 0; i < docs.length(); i++) {
					JSONObject snippet = (JSONObject) docs.get(i);
					String snip = (String) snippet.get("snippet");
					System.out.println(snip);
					request.setAttribute(("snip"+i), snip);
				}
				response1.close();

			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher req = request.getRequestDispatcher("resultPart3.jsp");
		req.forward(request, response);
	}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="text-align:center" >
<form action="/assignment3/getPart3" method="post">
NEW YORK TIME
<br>
<br>
<table border="1" align=center>
           <tr><td>research</td>
           <td><input type=text name=keyword id="keyword"></td></tr>
</table>
<br>
<input type=submit value=sumbit>
</form>
<%@ page import= "java.io.IOException"%>
<%@ page import= "java.io.InputStream"%>
<%@ page import= "java.io.InputStreamReader"%>
<%@ page import= "java.util.ArrayList"%>
<%@ page import= "org.apache.http.HttpEntity"%>
<%@ page import= "org.apache.http.client.ClientProtocolException"%>
<%@ page import= "org.apache.http.client.methods.CloseableHttpResponse"%>
<%@ page import= "org.apache.http.client.methods.HttpGet"%>
<%@ page import= "org.apache.http.impl.client.CloseableHttpClient"%>
<%@ page import= "org.apache.http.impl.client.HttpClients"%>
<%@ page import= "org.json.JSONArray" %>
<%@ page import= "org.json.JSONException" %>
<%@ page import= "org.json.JSONObject" %>
<%@ page import= "org.apache.http.util.EntityUtils" %>
<%
CloseableHttpClient httpclient = HttpClients.createDefault();
		try {
			String uri = ("http://api.nytimes.com/svc/search/v2/articlesearch.json");
			//uri+="?q="+request.getParameter("keyword");
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
					JSONObject docsObj = (JSONObject) docs.get(i);
					JSONObject headline = (JSONObject) docsObj.get("headline");
					String title = (String) headline.get("main");
					JSONObject snippet = (JSONObject) docs.get(i);
					String snip = (String) snippet.get("snippet");
					out.println("<a href="+url+">"+title+"</a >");
					out.println("<br>");
					out.println(snip);
					out.println("<br>");
					out.println("<br>");
				}
				response1.close();

			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

%>
</div>
</body>
</html>
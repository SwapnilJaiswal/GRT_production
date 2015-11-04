package sat.tool.competency;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.zip.GZIPInputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;

import org.jsoup.*;     
import org.jsoup.nodes.*;   
import org.jsoup.parser.*;

/**
 * Servlet implementation class ValidatePID
 */

public class ValidatePID extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String GET_PID_INFO_URL="https://wsgi.cisco.com/as/services/OPDataProfile/getProjectDetails";
	private static final String GET_PID_INFO_AUTH_SCOPE="wsgi.cisco.com";
	private static final String GET_PID_INFO_PORT="443";
	private static final String GET_REQUEST_SCHEME="https";
	private static final String GET_PID_INFO_REQ_START="<projectProfileResponse><projectSnapShot><projectId>";
	private static final String GET_PID_INFO_REQ_END="</projectId></projectSnapShot><roleEffectiveStatus>Both</roleEffectiveStatus><dataSort><sortOrder>Asc</sortOrder><sortBy>project_id</sortBy><pageNumber>1</pageNumber><numberOfItems>25</numberOfItems></dataSort></projectProfileResponse>";
	private static final String OP_SERVICE_UN="sdca.gen";
	private static final String OP_SERVICE_PWD="cisco123";
	private static final String CHAR_ENCODING="UTF-8";
	private static final String CONTENT_HEADER_FORM="application/x-www-form-urlencoded";
    
	private static PrintWriter out;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidatePID() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse servletResponse) throws ServletException, IOException {

		HttpResponse dcpResponse = null;
		servletResponse.setContentType("text/plain");
		out = servletResponse.getWriter();
		
		//Sending a request to DCP
		String pid = request. getParameter("pid");
		dcpResponse=getPidInfo(pid);
		
		//Handling the response from DCP
		String responseBody = DecompressResponse(dcpResponse);
		String totalRecords = GetPIDRecords(responseBody);
		//out.println(totalRecords);
		out.write(totalRecords);
	}

	//Method to POST request to DCP for PID information 
	public static HttpResponse getPidInfo(String pid) {
		
		HttpResponse response = null;
		try {
			
			String url = GET_PID_INFO_URL;
			CloseableHttpClient httpclient = HttpClientBuilder.create().build();
			HttpHost targetHost = new HttpHost(GET_PID_INFO_AUTH_SCOPE, Integer.parseInt(GET_PID_INFO_PORT),GET_REQUEST_SCHEME);

			//Adding credentials required to access the webservice
			CredentialsProvider credsProvider = new BasicCredentialsProvider();
			credsProvider.setCredentials(new AuthScope(targetHost.getHostName(), targetHost
							.getPort()),
					new UsernamePasswordCredentials(OP_SERVICE_UN, OP_SERVICE_PWD));

			/** Create AuthCache instance **/
			AuthCache authCache = new BasicAuthCache();
			/** Generate BASIC scheme object and add it to the local auth cache **/
			BasicScheme basicAuth = new BasicScheme();
			authCache.put(targetHost, basicAuth);
			HttpClientContext context = HttpClientContext.create();
			context.setCredentialsProvider(credsProvider);
			context.setAuthCache(authCache);
			HttpPost post = new HttpPost(url);

			//Xml request constructed dynamically
			StringBuilder xmlRequestFinal = new StringBuilder();
			xmlRequestFinal.append(GET_PID_INFO_REQ_START);
			xmlRequestFinal.append(pid);
			xmlRequestFinal.append(GET_PID_INFO_REQ_END);
						
			HttpEntity entity = new ByteArrayEntity(xmlRequestFinal.toString()
					.getBytes(CHAR_ENCODING));
			
			//Adding required headers
			post.setHeader("Content-type",CONTENT_HEADER_FORM);
			post.addHeader("CONSUMER_ID" , "asdcop.gen");
			
			
			post.setEntity(entity);
			
			response = httpclient.execute(targetHost, post, context);
			
		} catch (UnsupportedEncodingException e) {
			out.println("Encoding exception"+e.getMessage());
		}
		 catch (IOException e) {
			out.println("Exception in communicating to the OP server-getBasicProjectInfo" + e.getMessage());
		}
		catch (Exception e){
			out.println("Generic Exception in getBasicProjectInfo in communicating to the OP server"+ e.getMessage());
		}
		return response;
	}

	//Method to decompress the gzipped content received from DCP web service
	public static String DecompressResponse(HttpResponse dcpResponse) throws IOException
	{
		InputStream in = getUngzippedContent(dcpResponse.getEntity());
		BufferedReader reader = new BufferedReader(new InputStreamReader(in));
		StringBuilder content = new StringBuilder();
		String line;
		while ((line = reader.readLine()) != null) {
			content.append(line);
		}
		reader.close();
		return content.toString();
	}
	

	//Helper method for DecompressResponse to return inputstream for gzipped content
	public static InputStream getUngzippedContent(HttpEntity entity) throws IOException {
		InputStream responseStream=entity.getContent();
		if (responseStream == null)   
			return responseStream;
		
		Header header=entity.getContentEncoding();
		if (header == null)   
			return responseStream;
		
		String contentEncoding=header.getValue();
		if (contentEncoding == null)   
			return responseStream;
		if (contentEncoding.contains("gzip"))   
		  responseStream=new GZIPInputStream(responseStream);
		  
		return responseStream;
	}
	
	
	public static String GetPIDRecords(String str){
		Document doc = Jsoup.parse(str.toString(), "", Parser.xmlParser());
        return (doc.select("totalRecords").text());
	}
}

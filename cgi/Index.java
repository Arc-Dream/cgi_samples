import java.util.HashMap; 
import java.util.Map;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.io.BufferedReader;
import java.net.HttpURLConnection; 


import java.io.IOException;
import java.io.InputStreamReader;


public class Index 
{

    public static Map<String, String> getQueryMap(String query) {  
        String[] params = query.split("&");  
        Map<String, String> map = new HashMap<String, String>();

        for (String param : params) {  
            String key = param.split("=")[0];  
            String value = param.split("=")[1];  
            map.put(key, value);  
        }  
        return map;  
    }

    public static void main(String[] args)
    {


        String type = "Content-type: text/html; charset=iso-8859-1\n\n";

        String output = """
                            <html>
                                <body>
                                    <h1>Hello World</h1>
                                </body>
                            </html>
                        """;


        String style =  """ 
                            <style>
                                body
                                {
                                    background-color: #333;
                                    color: #AAA;
                                }
                            </style>
                        """;

        System.out.println(type);
        System.out.println(style);
        System.out.println(output);
        
        try
        {
            String envVar = System.getenv("QUERY_STRING");

            String[] envVarList = envVar.split("&",2); 
            String[] envVarListSub;
            
            for (String a : envVarList)
            {
                envVarListSub = a.split("=",2);

                System.out.println(envVarListSub[0]+" : "+envVarListSub[1]+"<br>");     
            }
        }

        catch (Exception e)
        {
            System.out.println("NO GET value received !!!<br>");
        }

        


        String getPost = System.getenv("CONTENT_LENGTH");

        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        String buffer = null;

        try 
        {
            int contentLength = Integer.parseInt(System.getenv("CONTENT_LENGTH"));
            char[] charBuffer = new char[contentLength];
            int bytesRead = reader.read(charBuffer, 0, contentLength);
            
            if (bytesRead != -1) 
            {
                buffer = new String(charBuffer, 0, bytesRead);
            }

            String[] getPostList = buffer.split("&",3); 
            String[] getPostListSub;

            for (String a : getPostList)
            {
                getPostListSub = a.split("=",2);

                System.out.println(getPostListSub[0]+" : "+getPostListSub[1]+"<br>");     
            }
        } 
        
        catch (IOException | NumberFormatException e) 
        {
            e.printStackTrace();
        }

        finally
        {

        }
        
        // System.out.println(buffer);

        
            
            
        
        
    }

}
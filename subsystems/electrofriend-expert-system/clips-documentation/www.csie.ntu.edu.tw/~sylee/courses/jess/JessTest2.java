// A second servlet program that jess embedded in Java
// Usage : web/servlets/Jess?source=<jess file name>
//         root directory "c:/apache/htdocs" as specified in zone.properties

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import jess.*;

public class JessTest2 extends HttpServlet
{
	String root;
    public void init(ServletConfig Conf) throws ServletException {
        super.init(Conf);
    	//Get the directory in which jess files are stored
    	root = getInitParameter("root"); // specified in zone.properties if using JServ,
    }

    public void doGet(HttpServletRequest req,
                     HttpServletResponse res)
              throws ServletException, IOException {

    //Establish the type of output
    res.setContentType("text/html; charset=Big5");

    //Get an output stream
    PrintWriter out = res.getWriter();

    //Get the file name through the query string
    String fileRB = req.getParameter("source");

    //Construct an HTML form and send it back to the client
    out.println("<html>");
    out.println("<head><title>jess engine result</title></head>");
    out.println("<body bgcolor=\"#9cc3ef\">");
    out.println("<h2>The Jess Engine result</h2><pre>");

    try {
        // Open the rule base file
        BufferedReader br = new BufferedReader(new FileReader(root + fileRB));

        // Create a Jess engine
        Rete rete = new Rete();

        // connect Jess output to Writer out which will be sent to browser
        rete.addOutputRouter("t", out);
        rete.addOutputRouter("WSTDOUT", out);
        rete.addOutputRouter("WSTDERR", out);

        // Create a parser for the file, telling it where to take input
        // from and which engine to send the results to

        Jesp j = new Jesp(br, rete);
        try
        { // parse and execute one construct, without printing a prompt
            j.parse(false);
            rete.reset();
            rete.run();
        }
        catch (JessException re)
        {
            // All Jess errors are reported as 'JessException's.
            re.printStackTrace(rete.getErrStream());
        }

    }catch(IOException e){}

    out.println("</pre></body></html>");
    out.close();

    } // end doGet()

} // end servlet
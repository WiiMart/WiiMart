<%@ page import="com.databaseclass.MyDatabaseClass, java.io.*, java.util.*" %>
    <html>

    <head>

    </head>

    <body>
        <p>hi</p>
        <% MyDatabaseClass myClass=new MyDatabaseClass(); String msg=myClass.connect(); %>
            <script type="text/javascript">
                function createPostForm(name, url, otherFields) {
                    var form;
                    form = document.getElementById(name);
                    if (form == null) {
                        form = document.createElement("form");
                        form.action = url;
                        form.method = "post";
                        form.id = name;
                        document.body.appendChild(form);
                    }
                    var formHTML = "";
                    formHTML += otherFields;
                    form.innerHTML = formHTML;
                    return form;
                }
                function connect() {
                    return "<%= msg %>"
                }
                function query(statement) {
                    var form = createPostForm('myForm', '/oss/serv/class.jsp', '<input type="hidden" name="statement" value="'+statement+'"/>')
                    form.submit();

                }
            </script>
    </body>
    <% 
        String statement = request.getParameter("statement"); 
        if (statement==null) { 
            out.println("No statement"); 
        } else {
            out.println(myClass.query(statement)); 
        } 
    %>

    </html>
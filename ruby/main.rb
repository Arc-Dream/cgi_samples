#!C:\Ruby30-x64\bin\ruby.exe

require "cgi"
require "sqlite3"

db = SQLite3::Database.open 'test.db'
results = db.query "SELECT * FROM table1;"



cgi = CGI.new
@h = cgi.params




puts cgi.header


@selected = "Not Found"

results.each do |item|  
   if  item[2] == @h['email'][0]
        @selected = item
        break
   end
end



puts "

        <html>

            <style>
                body
                {
                    background-color: #333;
                    color: #AAA;
                }
            </style>

            <body>
                <h1>This is a test</h1>
                <h3>Selected Element:</h3>
                <h3>#{@selected[0]}</h3>                
                <h3>#{@selected[1]}</h3>
                <h3>#{@selected[2]}</h3>
                <h3>#{@selected[3]}</h3>
            </body>
        </html>
    
    "
#!C:\xampp\perl\bin\perl.exe


#GET REQUEST FETCH DATA
$get_url = $ENV{'QUERY_STRING'};
@pairs = split(/&/, $get_url);


#POST REQUEST FETCH DATA
read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
@pairs_post = split(/&/, $buffer);



print "Content-type: text/html; charset=iso-8859-1\n\n";


$head =     "
                <head>
                    <title>PERL</title>
                </head>
            ";

$style =    "
                <style>
                    body 
                    {
                        background-color :#333;
                        color: #AAA;
                    }
                </style>
            ";

$body =     "
                <body>
                    <h1>Hello World</h1>
                </body>
            ";


print $head1;
print $style;
print $body;

foreach $pair (@pairs)
{
    ($key, $value) = split(/=/, $pair);

    print "<p>$key = $value</p>";
}

foreach $pair (@pairs_post)
{
    ($key, $value) = split(/=/, $pair);

    print "<p>$key = $value</p>";
}








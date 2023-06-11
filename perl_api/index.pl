#!C:\xampp\perl\bin\perl.exe

use DBI;


### DATABASE SECTOR

    ## SET CONNECTION

        my $dsn = "DBI:mysql:data_try";
        my $db_username = "root";
        my $db_password = "123";

        my %attr = ( PrintError=>0,  RaiseError=>1);

        my $dbh = DBI -> connect($dsn, $db_username, $db_password, \%attr);

    ## GET ALL

        my $sql = "SELECT * FROM data_try1";

        my $stmt = $dbh->prepare($sql);

        $stmt->execute();




### AUTHENTICATION SECTOR

    ## SET VARIABLES

        my $auth = 0;

        @current_user = ('','');


    ## FETCH POST REQUEST DATA

        read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
        @pairs_post = split(/&/, $buffer);

        @pairs_post_email = split(/=/, @pairs_post[0]);
        @pairs_post_password = split(/=/, @pairs_post[1]);

        

        # print "{@pairs_post}";


    ## PROCESS FETCHED DATA

        if (@pairs_post_email[0] eq "email")
        {
            @current_user[0] = @pairs_post_email[1];
        }

        if (@pairs_post_password[0] eq "password")
        {
            @current_user[1] = @pairs_post_password[1];
        }


    ## EXECUTE AUTHETICATION

        if ((@current_user[0] eq "aa") && (@current_user[1] eq "123"))
        {
            $auth = 1;
        }



### DISPLAY SECTOR

    ## COMPARE AUTH VARIABLE

        if ($auth == 1)
        {
            print "Content-type: application/json; charset=iso-8859-1\n\n";

            @api_result = ();

            if ($ENV{'REQUEST_METHOD'} == "POST")
            {
                  
                while (my @array_result = $stmt->fetchrow_array())
                {
                    $data = qq-
                    {
                        "id" : "$array_result[0]",
                        "name" : "$array_result[1]",
                        "email" : "$array_result[2]",
                        "message" : "$array_result[3]"
                    }
                    -;    

                    push (@api_result, $data);
                }

                print @api_result;

                return @api_result;
            }          
        }

        else 
        {
            print "Content-type: application/json; charset=iso-8859-1\n\n";

            print '{"error":"no authentication"}';

        }









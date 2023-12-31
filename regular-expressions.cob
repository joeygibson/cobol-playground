        IDENTIFICATION DIVISION.
        PROGRAM-ID. Regular-Expression.
        author. Joey Gibson.
        DATE-WRITTEN. 2023-12-29.

        ENVIRONMENT DIVISION.
        configuration section.
      *  repository.
      *      function all intrinsic regular-expression.

        DATA DIVISION.
        
        working-storage section.
        01  WS-string-1 PIC X(20) VALUE "8eight1".
        01  WS-pattern pic x(57) value 
            "(?=(one|two|three|four|five|six|seven|eight|nine|[1-9]))".
        01  WS-return-code pic s9(4) comp-5.
        01  WS-regex pic s9(4) comp-5.
      *  01  WS-matches pic s9(4) comp-5.
        01  WS-matches.
            05  WS-matches-count pic s9(4) comp-5.
            05  WS-matches-1 occurs 0 to 9 times depending 
                on WS-matches-count.
                10  WS-matches-1-start pic s9(4) comp-5.
                10  WS-matches-1-end pic s9(4) comp-5.

        PROCEDURE DIVISION.
            call "pcre_compile" using WS-pattern
              returning WS-REGEX.

            call "pcre_exec" using 
              WS-regex
              0
              WS-string-1
              length of WS-string-1
              0
              0
              WS-matches
              0
              returning WS-return-code
            end-call
            if WS-return-code = 0
                display "No match found"
            else
                display "Match found"
                display "Number of matches: " WS-RETURN-CODE
                display 'matches: ' WS-MATCHES

                display "Group 1: " WS-MATCHES-1(1)
                display "Group 2: " WS-MATCHES-1(2)
                display "Group 3: " WS-MATCHES-1(3)
      *         call "Group" using WS-string-1 1
      *           giving extracted-string
      *
      *         display "Group 1: " extracted-string
            end-if.
        
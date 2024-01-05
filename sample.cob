       identification division.
       program-id. Sample.
      * program to display COBOL greeting

       data division.
       working-storage section.
       01  iter-num pic 9 value 5.

       procedure division.
       begin.
           perform display-greeting iter-num times.
           stop run.

       display-greeting.
           display "Hello, world!".
           
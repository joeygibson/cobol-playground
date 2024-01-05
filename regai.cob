        IDENTIFICATION DIVISION.
        PROGRAM-ID. RegAI.
        author. Claud-AI.
        DATE-WRITTEN. 2024-01-01.

        ENVIRONMENT DIVISION.
        configuration section.
      *  repository.
      *      function all intrinsic regular-expression.

        DATA DIVISION.        
        working-storage section.      
      * Declare the necessary C types
        01 C-INT PIC S9(9) COMP.
        01 PCRE-RET PIC S9(9) COMP.
        01 PATTERN PIC X(100). 
        01 SUBJECT PIC X(100).
        01 OVECTOR PIC X(100).
        01 OVECTOR-SIZE PIC S9(4) COMP.
      
        PROCEDURE DIVISION.  
      * Compile the regular expression
            MOVE "Hello world" TO PATTERN.
       
           CALL "pcre_compile" USING 
                   PATTERN 
                   LENGTH OF PATTERN
                   PCRE-COMPILE-RESULT
                   PCRE-ERROR-STRING 
           END-CALL
       
      * Execute the regular expression
          MOVE "Hello everyone" TO SUBJECT
          MOVE 30 TO OVECTOR-SIZE
          
          CALL "pcre_exec" USING   
               PCRE-COMPILE-RESULT
               NULL 
               SUBJECT
               LENGTH OF SUBJECT
               0 
               NULL
               OVECTOR 
               OVECTOR-SIZE
               PCRE-RET
        END-CALL

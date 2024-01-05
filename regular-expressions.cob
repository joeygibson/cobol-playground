        IDENTIFICATION DIVISION.
        PROGRAM-ID. RegexTest.

        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 WS-PATTERN PIC X(100) VALUE 
            "(?=(one|two|three|four|five|six|seven|eight|nine|[1-9]))".
        01 WS-STRING PIC X(100) VALUE "8eight1".
        01 WS-REGEX USAGE POINTER.
        01 WS-ERROR-CODE PIC S9(4) COMP-5.
        01 WS-ERROR-OFFSET PIC S9(4) COMP-5.
        01 WS-OVECTOR OCCURS 30 TIMES PIC S9(4) COMP-5.
        01 WS-RESULT PIC S9(4) COMP-5.
        01 WS-I PIC S9(4) COMP-5.

        PROCEDURE DIVISION.
            CALL "pcre_compile" USING 
                WS-PATTERN
                LENGTH OF WS-PATTERN
                0
                ADDRESS OF WS-ERROR-CODE
                ADDRESS OF WS-ERROR-OFFSET
                0
            RETURNING WS-REGEX.

            IF WS-REGEX = NULL
                DISPLAY "Error compiling regex"
                DISPLAY "Error code: " WS-ERROR-CODE
            ELSE
                CALL "pcre_exec" USING 
                    WS-REGEX
                    NULL
                    WS-STRING
                    LENGTH OF WS-STRING
                    0
                    0
                    ADDRESS OF WS-OVECTOR(1)
                    LENGTH OF WS-OVECTOR
                RETURNING WS-RESULT.

                IF WS-RESULT >= 0
                    DISPLAY "Match found"
                    PERFORM VARYING WS-I FROM 1 BY 1 
                      UNTIL WS-I > WS-RESULT
                        DISPLAY "Capture group " WS-I ": "
                        DISPLAY WS-STRING(WS-OVECTOR(WS-I * 2 - 1) + 
                          1:WS-OVECTOR(WS-I * 2))
                    END-PERFORM
                ELSE
                    DISPLAY "Match not found"
                END-IF
            
            STOP RUN.

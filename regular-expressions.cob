        IDENTIFICATION DIVISION.
        PROGRAM-ID. RegexTest.

        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 WS-PATTERN PIC X(100) VALUE 
            "(?=(one|two|three|four|five|six|seven|eight|nine|[1-9]))".
        01 WS-STRING PIC X(100) VALUE "8eight1".
        01 WS-PATTERN-FOR-C PIC X(101).
        01 WS-STRING-FOR-C PIC X(101).
        01 WS-REGEX USAGE BINARY-INT.
        01 WS-ERROR-CODE USAGE BINARY-INT.
        01 WS-ERROR-OFFSET USAGE UNSIGNED-INT.
        01 WS-OVECTOR OCCURS 30 TIMES PIC S9(4) COMP-5.
        01 WS-RESULT PIC S9(4) COMP-5.
        01 WS-I PIC S9(4) COMP-5.

        PROCEDURE DIVISION.
            move 123456789 to WS-REGEX.
            display "Regex: " WS-REGEX
            move function concatenate(WS-PATTERN, X'00') 
              to WS-PATTERN-FOR-C.
            move function concatenate(WS-STRING, X'00')
              to WS-STRING-FOR-C.

            CALL "pcre_compile" USING 
                WS-PATTERN-FOR-C
                LENGTH OF WS-PATTERN-FOR-C
                0
                address of WS-ERROR-CODE
                address of WS-ERROR-OFFSET
                0
            RETURNING WS-REGEX.

            display "Regex: " WS-REGEX.
            display "Error code: " WS-ERROR-CODE.
            display "Error offset: " WS-ERROR-OFFSET.

            IF WS-REGEX not equal to 0
                DISPLAY "Error compiling regex"
                DISPLAY "Error code: " WS-ERROR-CODE
            ELSE
                CALL "pcre_exec" USING 
                    WS-REGEX
                    NULL
                    WS-STRING-FOR-C
                    LENGTH OF WS-STRING-FOR-C
                    0
                    0
                    ADDRESS OF WS-OVECTOR(1)
                    LENGTH OF WS-OVECTOR
                RETURNING WS-RESULT

                display "Result: " WS-RESULT

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
            END-IF.
            
            STOP RUN.

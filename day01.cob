        IDENTIFICATION DIVISION.
        PROGRAM-ID. Day01.
        author. Joey Gibson.
        DATE-WRITTEN. 2023-12-28.

        ENVIRONMENT DIVISION.
        INPUT-OUTPUT SECTION.
        FILE-CONTROL.
        SELECT InputFile ASSIGN TO "data/input0.txt"
          ORGANIZATION IS LINE SEQUENTIAL.

        DATA DIVISION.
        FILE SECTION.
        FD InputFile.
        01  InputRecord PIC X(100).

        WORKING-STORAGE SECTION.
        01  WS-Total PIC 9(10).
        01  WS-Num-As-String PIC X(10).
        01  WS-eof PIC X VALUE "N".
        01  WS-Index PIC 9(10) VALUE 1.
        01  WS-Digit-Found PIC X VALUE "N".

        PROCEDURE DIVISION.
        Begin.
            OPEN INPUT InputFile.
            perform until WS-eof = "Y"
                READ InputFile into InputRecord
                    AT END
                        MOVE "Y" TO WS-eof
                    NOT AT END
                      perform varying WS-Index from 1 by 1
                        until InputRecord(WS-Index:1) = SPACE
      
                        display 'InputRecord(WS-Index:1): ' 
                          InputRecord(WS-Index:1)
                        if InputRecord(WS-Index:1) is NUMERIC
                          if WS-Digit-Found = "N"
                            Move InputRecord(WS-Index:1) to
                              WS-Num-As-String(1:1)
                            Move "Y" to WS-Digit-Found
                          else
                            Move InputRecord(WS-Index:1) to
                              WS-Num-As-String(2:1)
                          end-if
                        end-if
                      end-perform

                    if WS-Num-As-String(2:1) = SPACE
                      move WS-Num-As-String(1:1) 
                        to WS-Num-As-String(2:1)
                    end-if

                    display 'WS-Num-As-String: ' WS-Num-As-String
                    add function NUMVAL(WS-Num-As-String) to WS-Total

                    move SPACES to WS-Num-As-String
                    move 'N' to WS-Digit-Found
                END-READ
            END-PERFORM.
            close InputFile.

            display "Total is " WS-Total
            stop run.

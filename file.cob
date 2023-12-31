        IDENTIFICATION DIVISION.
        PROGRAM-ID. HELLO-WORLD.
        author. Joey Gibson.
        DATE-WRITTEN. 2023-12-28.

        ENVIRONMENT DIVISION.
        INPUT-OUTPUT SECTION.
        FILE-CONTROL.
        SELECT StudentFile ASSIGN TO "data/STUDENT.DAT"
          ORGANIZATION IS LINE SEQUENTIAL.

        DATA DIVISION.
        FILE SECTION.
        FD StudentFile.
        01 StudentRecord.
          05 StudentId PIC 9(9).
          05 StudentName PIC X(20).
          05 StudentAge PIC 99.

        WORKING-STORAGE SECTION.
        01 WS-EOF PIC X VALUE "N".

        PROCEDURE DIVISION.
        100-MAIN.
            OPEN INPUT StudentFile
            PERFORM UNTIL WS-EOF = "Y"
                READ StudentFile
                  at end move "Y" to WS-EOF
                  not at end DISPLAY StudentId SPACE
                    StudentName SPACE StudentAge
            END-PERFORM
            CLOSE StudentFile
            STOP RUN.

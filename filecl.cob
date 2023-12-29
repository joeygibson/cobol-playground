        IDENTIFICATION DIVISION.
        PROGRAM-ID. FileCL.
        author. Joey Gibson.
        DATE-WRITTEN. 2023-12-29.

        ENVIRONMENT DIVISION.
        INPUT-OUTPUT SECTION.
        FILE-CONTROL.
            SELECT F-input-file ASSIGN TO WS-FILE-NAME
                ORGANIZATION IS LINE SEQUENTIAL.

        DATA DIVISION.
        FILE SECTION.
        FD  F-input-file.
        01  F-input-record.
            05  F-input-record-data PIC X(80).

        working-storage section.
        01  WS-file-name PIC X(100).
        01  WS-args-count PIC 9(4) COMP.
        01  WS-EOF PIC X VALUE "N".

        PROCEDURE DIVISION.
            accept WS-ARGS-COUNT from argument-number.
            perform WS-ARGS-COUNT times
                accept WS-FILE-NAME from argument-value
            end-perform

            display 'file name: ' WS-FILE-NAME

            open input F-input-file.
            perform until WS-EOF = "Y"
                read F-input-file
                    at end
                        set WS-EOF to "Y"
                    not at end
                        display F-input-record-data
                end-read
            end-perform
            close F-input-file.
            stop run.

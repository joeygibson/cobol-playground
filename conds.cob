        IDENTIFICATION DIVISION.
        PROGRAM-ID. HELLO-WORLD.
        author. Joey Gibson.
        DATE-WRITTEN. 2023-12-28.

        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01  WS-COUNTRY-NAME PIC X(20) VALUE SPACES.
          88 WS-USA-FLAG VALUE "USA".
          88 WS-UK-FLAG VALUE "UK".
          88 WS-GERMANY-FLAG VALUE "GERMANY".

        PROCEDURE DIVISION.
        MAIN-LOGIC.
            DISPLAY "Hello World!".
            MOVE "USA" TO WS-COUNTRY-NAME.
            IF WS-USA-FLAG THEN
                DISPLAY "Hello USA!"
            END-IF.
            MOVE "UK" TO WS-COUNTRY-NAME.
            IF WS-UK-FLAG
                DISPLAY "Hello UK!"
            END-IF.
            MOVE "GERMANY" TO WS-COUNTRY-NAME.
            IF WS-GERMANY-FLAG
                DISPLAY "Hello Germany!"
            END-IF.
            STOP RUN.

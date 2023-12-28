        IDENTIFICATION DIVISION.
        PROGRAM-ID. HELLO-WORLD.
        author. Joey Gibson.
        DATE-WRITTEN. 2023-12-28.

        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01  WS-USER-NAME PIC X(20).
        01  WS-CURRENT-DATE.
            05  WS-CURRENT-YEAR PIC 9(4).
            05  WS-CURRENT-MONTH PIC 99.
            05  WS-CURRENT-DAY PIC 99.

        01  WS-NEXT-YEAR PIC 9(4).
        01  WS-FOO PIC 9(4).

        PROCEDURE DIVISION.
            display 'What is your name? ' with no advancing.
            accept WS-USER-NAME.
            display 'Hello, ' WS-USER-NAME ', it is ' with no advancing.
            accept WS-CURRENT-DATE from date YYYYMMDD.
            display WS-CURRENT-DATE.
            add 1 to WS-CURRENT-YEAR giving WS-NEXT-YEAR.
            display 'Next year is ' WS-NEXT-YEAR.
            compute ws-foo = 1 + 2 * WS-NEXT-YEAR.
            display 'Foo is ' WS-FOO.
            move 99 to WS-FOO.
            display 'Foo is ' WS-FOO.

            if WS-USER-NAME = 'Frank' THEN
                display 'Hello, Frank, you are the best!' 
            else
                display 'Hello, ' WS-USER-NAME ', you are not Frank.'
            end-if.
            STOP RUN.
        END PROGRAM HELLO-WORLD.
        
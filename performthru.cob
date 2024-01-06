       IDENTIFICATION DIVISION.
       PROGRAM-ID. PerformThru.
       AUTHOR. Joey Gibson.
      * Demonstrates safe usage of `perform` ... `thru`

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  ShouldSkip PIC 9 VALUE 0.

       PROCEDURE DIVISION.
       Begin.
           DISPLAY 'First run'
           PERFORM SumEarnings THRU SumEarningsExit
           DISPLAY 'Second run'
           MOVE 1 to ShouldSkip
           PERFORM SumEarnings THRU SumEarningsExit
           STOP RUN.

       SumEarnings.
           DISPLAY "SumEarnings"
           IF ShouldSkip = 1
               DISPLAY "Skipping"
               GO TO SumEarningsExit
           END-IF

           DISPLAY "Not skipping".

       SumEarningsExit.
           DISPLAY "SumEarningsExit"
           EXIT.
           
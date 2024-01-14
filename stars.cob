       IDENTIFICATION DIVISION.
       PROGRAM-ID.  Stars.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  OrigStars  PIC *****.
       01  Stars      PIC *****.
       01  NumOfStars PIC 9.

       PROCEDURE DIVISION.
       Begin.
           PERFORM VARYING NumOfStars FROM 1 BY 1 UNTIL NumOfStars > 5
               COMPUTE OrigStars = 10 ** (4 - NumOfStars)
               MOVE OrigStars TO Stars
      *> the following two `INSPECT` statements are equivalent
      *        INSPECT Stars CONVERTING '10' TO SPACES
               INSPECT Stars REPLACING ALL '1' BY SPACE,
                                       ALL '0' BY SPACE
               DISPLAY NumOfStars ' = ' Stars ', ' OrigStars
           END-PERFORM.
           STOP RUN.

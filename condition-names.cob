       IDENTIFICATION DIVISION.
       PROGRAM-ID. ConditionNames.
       AUTHOR. Joey Gibson.
      * Using condition names (level 88s) and the EVALUATE verb
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  CharIn PIC X.
              88 Vowel value 'a', 'e', 'i', 'o', 'u'.
              88 Consonant value "b", "c", "d", "f", "g", "h"
                     "j" THRU "n", "p" THRU "t", "v" THRU "z".
              88 Digit value "0" THRU "9".
              88 ValidCharacter value "a" THRU "z", "0" THRU "9".
       01  Grade PIC X.
              88 Is-A value "A", "a".
              88 Is-B value "B", "b".
              88 Is-C value "C", "c".
              88 Is-D value "D", "d".
              88 Is-F value "F", "f".

       01  CountryCode PIC 999 VALUE ZEROES.
           88 BritishCountry VALUES 3, 7, 10, 15.

       01  CurrencyCode PIC 99 VALUE ZEROES.
           88 CurrencyIsPound VALUE 14.
           88 CurrencyIsEuro VALUE 03.
           88 CurrencyIsDollar VALUE 28.
       
       PROCEDURE DIVISION.
       Begin.
           DISPLAY 'Enter a character: ' WITH NO ADVANCING.
           ACCEPT CharIn.
           PERFORM UNTIL NOT ValidCharacter
              EVALUATE TRUE
                     WHEN Vowel DISPLAY 'The letter ' CharIn
                            ' is a vowel.'
                     WHEN Consonant DISPLAY 'The letter ' CharIn
                            ' is a consonant.'
                     WHEN Digit DISPLAY 'The character ' CharIn
                            ' is a digit.'
              END-EVALUATE
              ACCEPT CharIn
           END-PERFORM

           MOVE 'C' to Grade.
           
           IF Grade = 'A' or 'B'
              DISPLAY 'Great!'
           ELSE IF Grade = 'C' or 'D'
              DISPLAY 'OK'
           ELSE
              DISPLAY 'You failed.'
           END-IF

           DISPLAY '---'

           IF Is-A
              DISPLAY 'GreatX!'
           ELSE IF Is-B
              DISPLAY 'OK'
           ELSE
              DISPLAY 'You failed.'
           END-IF

           DISPLAY '---'

           IF Is-C
              DISPLAY "X entered"
           END-IF

           IF Is-D
              DISPLAY "Y entered"
           END-IF

           IF Is-F
              DISPLAY "Z entered"
           END-IF

           DISPLAY 'Enter country code: ' WITH NO ADVANCING.
           ACCEPT CountryCode.

           IF BritishCountry THEN
              SET CurrencyIsPound TO TRUE
           END-IF

           IF CurrencyIsPound THEN
              DISPLAY "Pound sterling used in this country"
           ELSE
              DISPLAY "Country does not use sterling"
           END-IF

           STOP RUN.

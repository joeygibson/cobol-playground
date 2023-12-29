        IDENTIFICATION DIVISION.
        PROGRAM-ID. HELLO-WORLD.
        author. Joey Gibson.
        DATE-WRITTEN. 2023-12-28.

      * A program to simulate a mileage counter.

        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 Counters.
          02 HundredsCnt PIC 99 VALUE ZEROES.
          02 TensCnt PIC 99 VALUE ZEROES.
          02 UnitsCnt PIC 99 VALUE ZEROES.

        01 DisplayItems.
          02 PrnHunds PIC 9.
          02 PrnTens PIC 9.
          02 PrnUnits PIC 9.

        PROCEDURE DIVISION.
        Begin.
            display 'Using an out-of-line perform'.
            display 'About to start mileage counter'.

            perform CountMileage
              varying HundredsCnt from 0 by 1 until HundredsCnt > 9
              after TensCnt from 0 by 1 until TensCnt > 9
              after UnitsCnt from 0 by 1 until UnitsCnt > 9.

            display 'Finished mileage counter'.

            display 'now using in-line perform'
            display 'About to start mileage counter'.

            perform varying HundredsCnt from 0 by 1
              until HundredsCnt > 9
              perform varying TensCnt from 0 by 1 until TensCnt > 9
                perform varying UnitsCnt from 0 by 1 until UnitsCnt > 9
                  move HundredsCnt to PrnHunds
                  move TensCnt to PrnTens
                  move UnitsCnt to PrnUnits

                  display PrnHunds '-' PrnTens '-' PrnUnits
                end-perform
              end-perform
            end-perform.

            display 'end of mileage simulator'.
            stop run.

        CountMileage.
            move HundredsCnt to PrnHunds
            move TensCnt to PrnTens
            move UnitsCnt to PrnUnits

            display PrnHunds '-' PrnTens '-' PrnUnits.



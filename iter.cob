        IDENTIFICATION DIVISION.
        PROGRAM-ID. HELLO-WORLD.
        author. Joey Gibson.
        DATE-WRITTEN. 2023-12-28.

      * An example program showing use of `perform`

        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01  RecCount pic 9(2).

        PROCEDURE DIVISION.
        TopLevel.
            display 'in top level. starting run'
            perform OneLevelDown
            display 'back in top level'.

            perform foo thru bar.

            perform 3 times
              display 'in loop'
            end-perform.
            
            perform baz 3 times.

            perform SayHi varying RecCount from 1 by 1 
              until RecCount > 5.
            
            stop run.

        SayHi.
            display 'Hi there! This is iteration ' RECCOUNT.

        TwoLevelsDown.
            display '>>>> in two levels down'
            perform ThreeLevelsDown.
            display '>>>> back in two levels down'.

        OneLevelDown.
            display '>> in one level down'
            perform TwoLevelsDown
            display '>> back in one level down'.

        ThreeLevelsDown.
            display '>>>>> in three levels down'.

        foo.
            display 'in foo'.
            display 'in foo again'.
            display 'in foo again again'.

        bar.
            exit.

        baz.
            display 'in baz'.


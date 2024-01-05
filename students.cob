       identification division.
       program-id. Students.
       author. Joey Gibson.
       date-written. 2018-04-01.

       environment division.
       input-output section.
       file-control.
           select students-file assign to "students1.dat"
               organization is line sequential.

       data division.
       file section.
       FD students-file.
        01 student-record.
            88 end-of-student-file value high-values.
            02 student-id pic 9(7).
            02 student-name.
               03 student-last-name pic x(8).
               03 student-initials pic xx.
            02 date-of-birth.
               03 student-birth-year pic 9(4).
               03 student-birth-month pic 99.
               03 student-birth-day pic 99.
            02 course-code pic x(4).
            02 gender pic x.

       procedure division.
       Begin.
           open output students-file.

           display 'enter student details using template below.'
           display 'enter no data to end.'

           perform get-student-record
           perform until student-record = SPACES
                write student-record
                perform get-student-record
           end-perform
           close students-file

           open input students-file.
           read students-file
               at end set end-of-student-file to true
            end-read

            perform until end-of-student-file
                display student-id space student-name space
                   course-code 
                read students-file
                    at end set end-of-student-file to true
                end-read
            end-perform
            close students-file
            stop run.

        get-student-record.
           display "NNNNNNNSSSSSSSSIIYYYYMMDDCCCCG".
           accept student-record.
               
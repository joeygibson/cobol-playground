       IDENTIFICATION DIVISION.
       PROGRAM-ID.  VarLen.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT LongNameFile ASSIGN TO NameOfFile
             ORGANIZATION IS LINE SEQUENTIAL.
    
       DATA DIVISION.
       FILE SECTION.
      *> With a variable length record, the record length is
      *> moved by the system into the NameLength field. For
      *> reads, this is a little unintuitive, but for writes,
      *> you first must move the length of the record into
      *> NameLength, before calling the WRITE statement.     
       FD  LongnameFile
           RECORD IS VARYING IN SIZE
           DEPENDING ON NameLength.
       01  LongNameRec PIC X(40).
           88 EndOfNames VALUE HIGH-VALUES.

       WORKING-STORAGE SECTION.
       01  NameLength PIC 9(2).
       01  NameOfFile PIC X(20).

       PROCEDURE DIVISION.
       Begin.
           DISPLAY 'Enter the name of the file :- '
             WITH NO ADVANCING.
           ACCEPT NameOfFile.
           OPEN INPUT LongNameFile.
           READ LongNameFile
             AT END SET EndOfNames TO TRUE
           END-READ.

           PERFORM UNTIL EndOfNames
             DISPLAY '***' LongNameRec(1:NameLength) '***'
             READ LongNameFile
               AT END SET EndOfNames TO TRUE
             END-READ
           END-PERFORM.

           CLOSE LongNameFile.
           STOP RUN.

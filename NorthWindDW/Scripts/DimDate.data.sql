IF NOT EXISTS (
    SELECT TOP (1) 1
    FROM dw.DimDate
)
BEGIN
    BEGIN TRAN;

    DECLARE @startdate DATE = '1996-01-01',
            @enddate   DATE = '1999-01-01';

    DECLARE @datelist TABLE (FullDate DATE);

    IF @startdate IS NULL
    BEGIN
        SELECT TOP 1
               @startdate = FullDate
        FROM dw.DimDate
        ORDER BY DateKey ASC;
    END;

    WHILE (@startdate <= @enddate)
    BEGIN
        INSERT INTO @datelist (FullDate)
        VALUES (@startdate);

        SET @startdate = DATEADD(DAY, 1, @startdate);
    END;

    INSERT INTO dw.DimDate
    (
        DateKey,
        FullDate,
        DayNumberOfWeek,
        DayNameOfWeek,
        DayNumberOfMonth,
        DayNumberOfYear,
        WeekNumberOfYear,
        MonthName,
        MonthNumberOfYear,
        CalendarQuarter,
        CalendarYear,
        CalendarSemester
    )
    SELECT
        CONVERT(INT, CONVERT(VARCHAR(8), dl.FullDate, 112)) AS DateKey,
        dl.FullDate,
        DATEPART(WEEKDAY, dl.FullDate),
        DATENAME(WEEKDAY, dl.FullDate),
        DATEPART(DAY, dl.FullDate),
        DATEPART(DAYOFYEAR, dl.FullDate),
        DATEPART(WEEK, dl.FullDate),
        DATENAME(MONTH, dl.FullDate),
        MONTH(dl.FullDate),
        DATEPART(QUARTER, dl.FullDate),
        YEAR(dl.FullDate),
        CASE DATEPART(QUARTER, dl.FullDate)
            WHEN 1 THEN 1
            WHEN 2 THEN 1
            WHEN 3 THEN 2
            WHEN 4 THEN 2
        END
    FROM @datelist dl
    LEFT JOIN dw.DimDate dd
           ON dl.FullDate = dd.FullDate
    WHERE dd.FullDate IS NULL;

    COMMIT TRAN;
END
GO
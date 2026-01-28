IF NOT EXISTS (
    SELECT 1
    FROM dw.DimDate
    WHERE DateKey = 0
)
BEGIN
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
    VALUES
    (
        0,
        GETDATE(),
        0,
        'Unknown',
        0,
        0,
        0,
        'Unknown',
        0,
        0,
        0,
        0
    );
END;
GO
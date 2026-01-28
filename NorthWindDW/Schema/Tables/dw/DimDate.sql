CREATE TABLE [dw].[DimDate]
(
	[DateKey] INT NOT NULL PRIMARY KEY,
    [FullDate] DATE NOT NULL,
    [DayNumberOfWeek] TINYINT,
    [DayNumberOfMonth] TINYINT,
    [DayNumberOfYear] SMALLINT,
    [DayNameOfWeek] NVARCHAR(10),
    [WeekNumberOfYear] TINYINT,
    [MonthNumberOfYear] TINYINT,
    [MonthName] NVARCHAR(10),
    [CalendarQuarter] TINYINT,
    [CalendarYear] SMALLINT,
    [CalendarSemester] TINYINT
)
GO
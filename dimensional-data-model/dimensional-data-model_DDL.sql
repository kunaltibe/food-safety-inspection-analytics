CREATE TABLE [dim_date] (
  [SK_Dim_Date] int NOT NULL,
  [Day_Num] int NOT NULL,
  [Day_Str] varchar(20) NOT NULL,
  [Month_Num] int NOT NULL,
  [Month_Str] varchar(50) NOT NULL,
  [Year_Num] int NOT NULL,
  [is_weekend] varchar(50) NOT NULL,
  [Dt] date NOT NULL,
  [DI_CreateDate] date NOT NULL,
  CONSTRAINT [_copy_3] PRIMARY KEY CLUSTERED ([SK_Dim_Date])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [dim_facilityType] (
  [SK_Dim_FacilityType] varchar(100) NOT NULL,
  [Facility_Type] varchar(100) NOT NULL,
  [DI_CreateDate] date NOT NULL,
  [DI_WorkflowFileName] varchar(100) NOT NULL,
  CONSTRAINT [_copy_4] PRIMARY KEY CLUSTERED ([SK_Dim_FacilityType])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [dim_inspectionResult] (
  [SK_Inspection_Result] varchar(10) NOT NULL,
  [Inspection_Result] varchar(80) NOT NULL,
  [DI_CreateDate] date NOT NULL,
  [DI_WorkflowFileName] varchar(200) NOT NULL,
  CONSTRAINT [_copy_7] PRIMARY KEY CLUSTERED ([SK_Inspection_Result])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [dim_inspectionType] (
  [SK_Dim_InspectionType] varchar(10) NOT NULL,
  [Inspection_Type] varchar(50) NOT NULL,
  [DI_CreateDate] date NOT NULL,
  [DI_WorkflowFileName] varchar(200) NOT NULL,
  CONSTRAINT [_copy_6] PRIMARY KEY CLUSTERED ([SK_Dim_InspectionType])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [dim_location] (
  [SK_Dim_Location] varchar(100) NOT NULL,
  [Address] varchar(100) NULL,
  [City] varchar(100) NULL,
  [State] varchar(100) NULL,
  [ZipCode] varchar(100) NULL,
  [Latitude] decimal(15,10) NULL,
  [Longitude] decimal(15,10) NULL,
  [DI_CreateDate] date NULL,
  [DI_WorkflowFileName] varchar(100) NULL,
  CONSTRAINT [_copy_8] PRIMARY KEY CLUSTERED ([SK_Dim_Location])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [dim_restaurant] (
  [SK_Dim_Restaurant] varchar(20) NOT NULL,
  [FK_Dim_Location] varchar(100) NOT NULL,
  [Restaurant_Name] varchar(100) NOT NULL,
  [AKA_Name] varchar(100) NOT NULL,
  [DI_CreateDate] date NOT NULL,
  [DI_WorkflowFileName] varchar(100) NOT NULL,
  CONSTRAINT [_copy_1] PRIMARY KEY CLUSTERED ([SK_Dim_Restaurant])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [dim_riskCategory] (
  [SK_Dim_RiskCategory] varchar(100) NOT NULL,
  [Risk] varchar(100) NOT NULL,
  [DI_CreateDate] date NOT NULL,
  [DI_WorkflowFileName] varchar(100) NOT NULL,
  CONSTRAINT [_copy_5] PRIMARY KEY CLUSTERED ([SK_Dim_RiskCategory])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [dim_violations] (
  [SK_Dim_Violation] varchar(100) NOT NULL,
  [Violation_Code] int NOT NULL,
  [Violation_Description] varchar(3000) NOT NULL,
  [DI_CreateDate] date NOT NULL,
  [DI_WorkflowFileName] varchar(100) NOT NULL,
  CONSTRAINT [_copy_9] PRIMARY KEY CLUSTERED ([SK_Dim_Violation])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Fact_Inspection] (
  [SK_Fct_Inspection] varchar(100) NOT NULL,
  [FK_Dim_Date] int NOT NULL,
  [FK_Dim_Facility] varchar(100) NOT NULL,
  [FK_Inspection_Result] varchar(100) NOT NULL,
  [FK_Inspection_Type] varchar(100) NOT NULL,
  [FK_Dim_Risk_Category] varchar(100) NOT NULL,
  [FK_Dim_Restaurant] varchar(100) NOT NULL,
  [FK_Dim_Violation] varchar(100) NOT NULL,
  CONSTRAINT [_copy_2] PRIMARY KEY CLUSTERED ([SK_Fct_Inspection])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

ALTER TABLE [dim_restaurant] ADD CONSTRAINT [fk_dim_restaurant_dim_location] FOREIGN KEY ([FK_Dim_Location]) REFERENCES [dim_location] ([SK_Dim_Location])
GO
ALTER TABLE [Fact_Inspection] ADD CONSTRAINT [fk_Fact_Inspection_dim_date] FOREIGN KEY ([FK_Dim_Date]) REFERENCES [dim_date] ([SK_Dim_Date])
GO
ALTER TABLE [Fact_Inspection] ADD CONSTRAINT [fk_Fact_Inspection_dim_facilityType] FOREIGN KEY ([FK_Dim_Facility]) REFERENCES [dim_facilityType] ([SK_Dim_FacilityType])
GO
ALTER TABLE [Fact_Inspection] ADD CONSTRAINT [fk_Fact_Inspection_dim_inspectionResult] FOREIGN KEY ([FK_Inspection_Result]) REFERENCES [dim_inspectionResult] ([SK_Inspection_Result])
GO
ALTER TABLE [Fact_Inspection] ADD CONSTRAINT [fk_Fact_Inspection_dim_inspectionType] FOREIGN KEY ([FK_Inspection_Type]) REFERENCES [dim_inspectionType] ([SK_Dim_InspectionType])
GO
ALTER TABLE [Fact_Inspection] ADD CONSTRAINT [fk_Fact_Inspection_dim_riskCategory] FOREIGN KEY ([FK_Dim_Risk_Category]) REFERENCES [dim_riskCategory] ([SK_Dim_RiskCategory])
GO
ALTER TABLE [Fact_Inspection] ADD CONSTRAINT [fk_Fact_Inspection_dim_restaurant] FOREIGN KEY ([FK_Dim_Restaurant]) REFERENCES [dim_restaurant] ([SK_Dim_Restaurant])
GO
ALTER TABLE [Fact_Inspection] ADD CONSTRAINT [fk_Fact_Inspection_dim_violations] FOREIGN KEY ([FK_Dim_Violation]) REFERENCES [dim_violations] ([SK_Dim_Violation])
GO


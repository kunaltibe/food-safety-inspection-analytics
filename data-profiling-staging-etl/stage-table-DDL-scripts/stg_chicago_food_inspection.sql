USE [dadabi]
GO

/****** Object:  Table [dbo].[stg_chicago_food_inspection]    Script Date: 2/22/2024 1:04:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stg_chicago_food_inspection](
	[Inspection_ID] [int] NULL,
	[DBA_Name] [varchar](80) NULL,
	[AKA_Name] [varchar](80) NULL,
	[License] [int] NULL,
	[Facility_Type] [varchar](100) NULL,
	[Risk] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[Zip] [int] NULL,
	[Inspection_Date] [datetime] NULL,
	[Inspection_Type] [varchar](50) NULL,
	[Results] [varchar](80) NULL,
	[Violations] [varchar](max) NULL,
	[Latitude] [decimal](15, 10) NULL,
	[Longitude] [decimal](15, 10) NULL,
	[Location] [varchar](300) NULL,
	[DI_CreateDate] [datetime] NULL,
	[DI_WorkflowFileName] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



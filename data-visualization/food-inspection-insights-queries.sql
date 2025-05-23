-- Inspection Result
SELECT
    i.FK_Inspection_Result,
    r.Inspection_Result,
    COUNT(*) AS NumberOfInspections
FROM Fact_Inspection i
JOIN dim_inspectionResult r ON i.FK_Inspection_Result = r.SK_Inspection_Result
GROUP BY i.FK_Inspection_Result, r.Inspection_Result;

-- Top 10 Inspection Types
SELECT TOP 10
    it.Inspection_Type,
    COUNT(*) AS NumberOfInspections
FROM Fact_Inspection fi
JOIN dim_inspectionType it ON fi.FK_Inspection_Type = it.SK_Inspection_Type
GROUP BY it.Inspection_Type
ORDER BY NumberOfInspections DESC;

-- Risk Category
SELECT
    rc.Risk AS RiskCategory,
    COUNT(*) AS NumberOfInspections
FROM Fact_Inspection fi
JOIN dim_riskCategory rc ON fi.SK_Dim_RiskCategory = rc.SK_Dim_RiskCategory
GROUP BY rc.Risk
ORDER BY NumberOfInspections DESC;

-- Facility Type
SELECT
    ft.Facility_Type,
    COUNT(*) AS NumberOfInspections
FROM Fact_Inspection fi
JOIN dim_facilityType ft ON fi.FK_Dim_FacilityType = ft.SK_Dim_FacilityType
GROUP BY ft.Facility_Type
ORDER BY NumberOfInspections DESC;

-- Violation Codes and Descriptions
SELECT
  v.Violation_Code,
    v.Violation_Description,
    COUNT(*) AS NumberOfViolations
FROM Fact_Inspection fi
JOIN dim_violations v ON fi.FK_Dim_Violation = v.SK_Dim_Violation
GROUP BY v.Violation_Code, v.Violation_Description
ORDER BY NumberOfViolations DESC;
-- Retrieve all the information
SELECT * FROM seattlepetlicenses_formula_tool;

-- Retrieve all the information for S140122 pet license number
SELECT * FROM seattlepetlicenses_formula_tool
WHERE LicenseNumber= 'S140122';

-- Retreive all the pet licenses issued on 'May 19 2020'
SELECT * FROM seattlepetlicenses_formula_tool
WHERE LicenseIssueDate= 'May 19 2020';

-- Retrieve pet licenses issued in a specific ZIP code area:
SELECT * FROM seattlepetlicenses_formula_tool
WHERE ZIPCode = '98112';

-- Transformations on the "LicenseIssueDateFormatted" column, 
-- Extracted Date related columns using built-in functions
SELECT LicenseIssueDate,
day(LicenseIssueDateFormatted) AS Issue_Date,
month(LicenseIssueDateFormatted) AS Issue_Month,
monthname(LicenseIssueDateFormatted) AS Issue_MonthName,
year(LicenseIssueDateFormatted) AS Issue_Year,
dayname(LicenseIssueDateFormatted) AS Issue_Day,
date_format(LicenseIssueDateFormatted, '%m/%d/%Y') AS Date_Format_MMDDYYYY
FROM seattlepetlicenses_formula_tool;

-- License Issue Start Date
SELECT min(LicenseIssueDateFormatted) AS EarliestIssueDate
FROM seattlepetlicenses_formula_tool;

-- License Issue End Date
SELECT max(LicenseIssueDateFormatted) AS LatestIssueDate
FROM seattlepetlicenses_formula_tool;

-- Range of License Issue Dates
SELECT datediff(max(LicenseIssueDateFormatted), min(LicenseIssueDateFormatted)) AS TotalNumberofDays
FROM seattlepetlicenses_formula_tool;

-- List of unique species 
SELECT DISTINCT species
FROM seattlepetlicenses_formula_tool;

-- Total number of licenses
SELECT COUNT(*) AS Total_Licenses
FROM seattlepetlicenses_formula_tool;

-- Total Count of Distinct LicenseIssueDate
SELECT count(DISTINCT LicenseIssueDate) as Count_Of_Distinct_LicenseIssueDate
FROM seattlepetlicenses_formula_tool;

-- Total number of licenses of each LicenseIssueDate
SELECT LicenseIssueDate, COUNT(*) AS Count
FROM seattlepetlicenses_formula_tool
GROUP BY LicenseIssueDate;

-- Top 10 License Issue Dates
SELECT LicenseIssueDate, COUNT(*) AS Count
FROM seattlepetlicenses_formula_tool
GROUP BY LicenseIssueDate
ORDER BY Count DESC
LIMIT 10;

-- Total number of pet licenses issued in each year
SELECT year(LicenseIssueDateFormatted) as IssueYear, COUNT(*) AS Count
FROM seattlepetlicenses_formula_tool
GROUP BY IssueYear
ORDER BY Count DESC;

-- Top 5 years of pet licenses issued
SELECT year(LicenseIssueDateFormatted) as IssueYear, COUNT(*) AS Count
FROM seattlepetlicenses_formula_tool
GROUP BY IssueYear
ORDER BY Count DESC
limit 5;

-- Top 3 Months of License Issue Dates
SELECT date_format(LicenseIssueDateFormatted,'%M') as IssueMonth, COUNT(*) AS Count
FROM seattlepetlicenses_formula_tool
GROUP BY IssueMonth
ORDER BY Count DESC
LIMIT 3;

-- Top 3 Dates of License Issue Date
SELECT date_format(LicenseIssueDateFormatted,'%d') as IssueDate, COUNT(*) AS Count
FROM seattlepetlicenses_formula_tool
GROUP BY IssueDate
ORDER BY Count DESC
LIMIT 3;

-- Top 3 Days of License Issue Days
SELECT date_format(LicenseIssueDateFormatted,'%W') as IssueDays, COUNT(*) AS Count
FROM seattlepetlicenses_formula_tool
GROUP BY IssueDays
ORDER BY Count DESC
LIMIT 3;

-- Total Count of Distinct AnimalName
SELECT count(DISTINCT AnimalName) as Count_Of_Distinct_AnimalName
FROM seattlepetlicenses_formula_tool;

-- Total number of licenses of each AnimalName
SELECT AnimalName, COUNT(*) AS Count
FROM seattlepetlicenses_formula_tool
GROUP BY AnimalName;

-- !! NULL is not considered a distinct value !!

-- Top 10 Animal Names
SELECT AnimalName, COUNT(*) AS Count
FROM seattlepetlicenses_formula_tool
GROUP BY AnimalName
ORDER BY Count DESC
LIMIT 10;

-- Top 10 Dog Names
SELECT AnimalName, COUNT(*) AS Count
FROM seattlepetlicenses_formula_tool
WHERE Species='dog'
GROUP BY AnimalName
ORDER BY Count DESC
LIMIT 10;

-- Convert all animal names to UpperCase
SELECT upper(AnimalName) as ANIMALNAMES
FROM seattlepetlicenses_formula_tool;

-- Convert all animal names to LowerCase
SELECT lower(AnimalName) as animalnames
FROM seattlepetlicenses_formula_tool;

-- Find length of animal names string
SELECT AnimalName, length(AnimalName) as Length_animalnames
FROM seattlepetlicenses_formula_tool;

-- Concatenate Animal Name & Species
SELECT AnimalName, Species, concat(AnimalName,'-',Species) as NameSpeciesCombo
FROM seattlepetlicenses_formula_tool;

-- Total Count of Distinct Species
SELECT count(DISTINCT species) as Count_Of_Distinct_Species
FROM seattlepetlicenses_formula_tool;

-- Total number of licenses of each species
SELECT Species, COUNT(*) AS Count
FROM seattlepetlicenses_formula_tool
GROUP BY Species;

-- Total Count of Distinct Primary Breed
SELECT count(DISTINCT PrimaryBreed) as Count_Of_Distinct_PrimaryBreed
FROM seattlepetlicenses_formula_tool;

-- Total number of licenses of each PrimaryBreed
SELECT PrimaryBreed, COUNT(*) AS Count
FROM seattlepetlicenses_formula_tool
GROUP BY PrimaryBreed;

-- Top 10 Most Common Primary Breed
SELECT PrimaryBreed, COUNT(*) AS Count
FROM seattlepetlicenses_formula_tool
GROUP BY PrimaryBreed
ORDER BY Count DESC
LIMIT 10;

-- Top 10 Most Popular Primary Breed for Cats
SELECT PrimaryBreed, COUNT(*) AS Count
FROM seattlepetlicenses_formula_tool
WHERE Species='Cat'
GROUP BY PrimaryBreed
ORDER BY Count DESC
LIMIT 10;

-- Top 10 Most Popular Primary Breed for Dogs
SELECT PrimaryBreed, COUNT(*) AS Count
FROM seattlepetlicenses_formula_tool
WHERE Species='Dog'
GROUP BY PrimaryBreed
ORDER BY Count DESC
LIMIT 10;

-- Total Count of Distinct SecondaryBreed
SELECT count(DISTINCT SecondaryBreed) as Count_Of_Distinct_SecondaryBreed
FROM seattlepetlicenses_formula_tool;

-- Total number of licenses of each SecondaryBreed
SELECT SecondaryBreed, COUNT(*) AS Count
FROM seattlepetlicenses_formula_tool
GROUP BY SecondaryBreed;

-- Count of all the pet licenses that have a secondary breed specified
SELECT count(*) as Count_SpecifiedSecondaryBreed
FROM seattlepetlicenses_formula_tool
WHERE SecondaryBreed IS NOT NULL;

-- Count of pet licenses by species that have a secondary breed specified
SELECT Species, count(*) as Count_SpecifiedSecondaryBreed
FROM seattlepetlicenses_formula_tool
WHERE SecondaryBreed IS NOT NULL
Group by Species;

-- Total Count of Distinct ZIP Code
SELECT count(DISTINCT ZIPCode) as Count_Of_Distinct_ZIPCode
FROM seattlepetlicenses_formula_tool;

-- Total number of licenses of each ZipCode
SELECT ZIPCode, COUNT(*) AS Count
FROM seattlepetlicenses_formula_tool
GROUP BY ZIPCode;

-- Top 10 ZipCodes
SELECT ZIPCode, COUNT(*) AS Count
FROM seattlepetlicenses_formula_tool
GROUP BY ZIPCode
ORDER BY Count DESC
LIMIT 10;

--  Details of pets with the same name but different breeds
SELECT AnimalName, Species, COUNT(DISTINCT PrimaryBreed) AS NumberofDifferentBreeds
FROM seattlepetlicenses_formula_tool
GROUP BY AnimalName, Species
HAVING COUNT(DISTINCT PrimaryBreed) > 1
ORDER BY NumberofDifferentBreeds DESC;

--  Details of pets with the same name but different breeds
SELECT AnimalName, COUNT(DISTINCT Species) AS NumberofDifferentSpecies
FROM seattlepetlicenses_formula_tool
GROUP BY AnimalName
HAVING COUNT(DISTINCT Species) > 1
ORDER BY NumberofDifferentSpecies DESC;

-- ZIP code with the highest number of unique animal names
SELECT ZIPCode, COUNT(DISTINCT AnimalName) AS NumberofUniqueNames
FROM seattlepetlicenses_formula_tool
GROUP BY ZIPCode
ORDER BY NumberofUniqueNames DESC
LIMIT 1;

-- Number of days since the license was issued
SELECT LicenseNumber, LicenseIssueDateFormatted, DATEDIFF(CURDATE(), LicenseIssueDateFormatted) AS DaysSinceIssued
FROM seattlepetlicenses_formula_tool;

 -- percentage of licenses issued for each species compared to the total number of licenses
 -- Using SubQuery
SELECT Species, (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seattlepetlicenses_formula_tool)) AS Percentage
FROM seattlepetlicenses_formula_tool
GROUP BY Species;

-- Using Window Functions
SELECT
  Species,
  (COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()) AS Percentage
FROM seattlepetlicenses_formula_tool
GROUP BY Species;

-- Number of licenses issued for each breed, including both primary and secondary breeds
SELECT Breed, COUNT(*) AS TotalLicenses
FROM (
    SELECT PrimaryBreed AS Breed FROM seattlepetlicenses_formula_tool
    UNION ALL
    SELECT SecondaryBreed AS Breed FROM seattlepetlicenses_formula_tool
) AS AllBreeds
GROUP BY Breed;







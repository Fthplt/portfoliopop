
-- 2021 kýtalarýn nüfuslarý
Select Country_name,Year,Population from portfolyoproje..populations 
Where Country_name Like '%(UN)' and Year ='2021'
--Dunya Nufusu
Select SUM(Population) from portfolyoproje..populations 
Where Country_name Like '%(UN)' and Year ='2021'

--SUM(CASE WHEN ülke = 'Avrupa' THEN nüfus ELSE 0 END) AS Avrupa_Nüfusu,

--Select * from portfolyoproje..populations 


--En fazla nufus hakkýnda bilgiler
Select Country_name,Max(Population)as maks from portfolyoproje..populations
Where Year='2021' 
Group by Country_name
ORDER BY 2  DESC
--tr 500000000 dan az olan seneler
Select Country_name,Population,Year from populations
Where Country_name='Turkey' and Population < '50000000'
Order BY 2 DESC
--65 ve 70 00000000 arasý 
Select Country_name,Population,Year from populations
Where Country_name='Turkey' and Population BETWEEN '65000000' and '70000000'
ORDER BY 2
--bunu silicez
Select Year,Country_name,Population_of_children_under_the_age_of_1,(Select MAX(Population_of_children_under_the_age_of_1)from populations Where Country_name='Turkey' ) as maxunder1 from populations
Where Country_name='Turkey' 
--1 yaþ altý maksýmum olan seneler 
Select MAX(Population_of_children_under_the_age_of_1) as maxunder ,Year from populations
Where Country_name='Turkey'
Group by year
Order by 1 DESC 
--10 enaz nufuslu ulke
Select TOP 10 MIN(Population) as minpopulation ,Country_name,Year from populations
Where Year='2021'
Group by Country_name,Year
ORDER BY 1 

re 2021-2010 nufus artýþ hýzý
--Select * from  populations

--Select ((Select Population from  populations WHERE Country_name='Turkey' and Year='2021')-(Select Population from  populations WHERE Country_name='Turkey'  and Year='2010'))/(Select Population from  populations WHERE Country_name='Turkey' and Year='2010') * 100 as tr_popgrowthrate from  populations


Select Population_aged_15_to_64_years,Population,Year,Country_name,(Population_aged_15_to_64_years/Population) from populations
Order BY 3
Where Country_name='Turkey'
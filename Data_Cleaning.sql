-- Data Cleaning


select *
 from layoffs;
 
 -- 1. Remove Duplicates
 -- 2. Standatize the Data
 -- 3. Null values or black values
 -- 4. Remove Any Columns
 
 
 
 create table layoffs_staging
 like layoffs;
 
 
 select * 
 from layoffs_staging;
 
 insert layoffs_staging
 select * 
 from layoffs;
 
select *,
row_number() over(
partition by company, industry, total_laid_off, percentage_laid_off, `date`) as row_num
from layoffs_staging;


with duplicate_cte as
 (
 
 select *,
row_number() over(
partition by company, location,industry,total_laid_off, percentage_laid_off, `date`, stage
, country, funds_raised) as row_num
from layoffs_staging
)
select *
from duplicate_cte
where row_num > 1;

 select * 
 from layoffs_staging
 where company= 'Casper';



with duplicate_cte as
 (
  select *,
row_number() over(
partition by company, location,
 industry,total_laid_off, percentage_laid_off, `date`, stage
, country, funds_raised) as row_num
from layoffs_staging
)
delete  
from duplicate_cte
where row_num > 1;



CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `total_laid_off` bigint DEFAULT NULL,
  `date` text,
  `percentage_laid_off` text,
  `industry` text,
  `source` text,
  `stage` text,
  `funds_raised` text,
  `country` text,
  `date_added` text,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from layoffs_staging2
where row_num >1 ;

insert into layoffs_staging2
select *,
row_number () over (
partition by  company, location,
 industry,total_laid_off, percentage_laid_off, `date`, stage
, country, funds_raised) as row_num
from layoffs_staging;

delete 
from layoffs_staging2
where row_num > 1;

select *
 from layoffs_staging2;
 
 
 -- Standardizing data
 
 select company, trim(company)
 from layoffs_staging2;

update layoffs_staging2
set company =trim(company);


 select distinct industry
 from layoffs_staging2
;
 
  update layoffs_staging2
  set industry = 'Crypto'
  where industry like 'Crypto%';
 
 
select  distinct country, trim(trailing '.' from country)
from layoffs_staging2
order by 1;

 update layoffs_staging2
 set country =trim(trailing '.' from country)
 where country like 'United States%';

SET SQL_SAFE_UPDATES = 0;

 select  `date`
 from world_layoffs. layoffs_staging2;


UPDATE  layoffs_staging2
set `date` = STR_TO_DATE(`date`,'%m/%d/%Y');


alter table  layoffs_staging2
modify column `date` DATE;

SELECT *
FROM world_layoffs.layoffs_staging2;
DESCRIBE layoffs_staging2;

ALTER TABLE layoffs_staging2
DROP COLUMN date_added;

select * 
from layoffs_staging2
where total_laid_off IS NULL
AND percentage_laid_off IS NULL;

update layoffs_staging2
set industry = null
where industry='';

select *
from layoffs_staging2
where industry IS NULL
OR industry = '';

select * 
from layoffs_staging2
where company = 'Airbnb' ;

select t1.industry , t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
     on t1.company = t2.company
where (t1.industry is null or t1.industry='')
and t2.industry is not null;
    
update layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
set t1.industry = t2.industry
where (t1.industry is null or t1.industry='')
and t2.industry is not null;


select * 
from layoffs_staging2;

select * 
from layoffs_staging2
where total_laid_off IS NULL
AND percentage_laid_off IS NULL;


delete
from layoffs_staging2
where total_laid_off IS NULL
AND percentage_laid_off IS NULL;

select *
from layoffs_staging2;

alter table layoffs_staging2
drop column row_num;


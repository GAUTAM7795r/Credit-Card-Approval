/*1.Group the customers based on their income type and find the average of their annual income.
*/
 select cleaned_credit_card_for_sql.Type_Income ,avg(cleaned_credit_card_for_sql.Annual_income) as Avg_Annual_Income from credit_card.cleaned_credit_card_for_sql group by Type_Income;
 

 #2. Find the female owners of cars and property.
select cleaned_credit_card_for_sql.Gender,cleaned_credit_card_for_sql.Car_Owner,cleaned_credit_card_for_sql.Propert_Owner from credit_card.cleaned_credit_card_for_sql where Gender ='F' and Car_Owner = 'Y' and cleaned_credit_card_for_sql.Propert_Owner = 'Y';
#3. Find the male customers who are staying with their families.
select cleaned_credit_card_for_sql.Gender ,cleaned_credit_card_for_sql.Family_Members from credit_card.cleaned_credit_card_for_sql where Family_Members > 0 and Gender = 'M' ;
#4. Please list the top five people having the highest income.
select cleaned_credit_card_for_sql.Ind_id,cleaned_credit_card_for_sql.Gender,cleaned_credit_card_for_sql.Annual_income from cleaned_credit_card_for_sql where Annual_income  order by cleaned_credit_card_for_sql.Annual_income desc limit 5;
#5. # How many married people are having bad credit?
select cleaned_credit_card_for_sql.Ind_id,cleaned_credit_card_for_sql.Marital_status,cleaned_credit_card_for_sql.label from cleaned_credit_card_for_sql where Marital_status = 'Married' and label = 1;
#6. # What is the highest education level and what is the total count?
select distinct cleaned_credit_card_for_sql.Education ,count(Education) as Total_Counts from cleaned_credit_card_for_sql group by Education having Education = 'Academic degree';
#7. # Between married males and females, who is having more bad credit?
select cleaned_credit_card_for_sql.Gender,Marital_status,count(label) as Total_Label ,CASE when (select count(label) from cleaned_credit_card_for_sql where Gender ='M' and label =1)>(select count(label) from cleaned_credit_card_for_sql where Gender ='M' and label =1) then 'Males have more bad credit' else 'Females have more bad credit' end as Status_about_bad_loan from cleaned_credit_card_for_sql where Marital_status = 'Married' and label =1 group by Gender;


# Module 1 Homework: Docker & SQL

In this homework we'll prepare the environment and practice Docker and SQL

When submitting your homework, you will also need to include a link to your GitHub repository or other public code-hosting site.

This repository should contain the code for solving the homework.

When your solution has SQL or shell commands and not code (e.g. python files) file format, include them directly in the README file of your repository. 

# Question 1. Understanding docker first run

Run docker with the python:3.12.8 image in an interactive mode, use the entrypoint bash.

What's the version of pip in the image?

24.3.1  () 

docker run -it --entrypoint=bash python:3.12.8
Unable to find image 'python:3.12.8' locally
3.12.8: Pulling from library/python
fd0410a2d1ae: Already exists 
bf571be90f05: Already exists 
684a51896c82: Already exists 
fbf93b646d6b: Already exists 
12f3828c4288: Pull complete 
4d8be491b866: Pull complete 
ec162e081748: Pull complete 
Digest: sha256:2e726959b8df5cd9fd95a4cbd6dcd23d8a89e750e9c2c5dc077ba56365c6a925
Status: Downloaded newer image for python:3.12.8
root@d6abb1766640:/# pip --version
pip 24.3.1 from /usr/local/lib/python3.12/site-packages/pip (python 3.12)
root@d6abb1766640:/# 

# Question 2. Understanding Docker networking and docker-compose
db:5432


# Question 3. Trip Segmentation Count 

-- UP TO 1 MILE
SELECT COUNT(1) FROM public.green_taxi_trips
WHERE lpep_dropoff_datetime  BETWEEN '2019-10-01' AND '2019-10-31 23:59:59' 
AND trip_distance <= 1; 


-- In between 1 (exclusive) and 3 miles (inclusive) 
SELECT COUNT(1) FROM public.green_taxi_trips
WHERE lpep_dropoff_datetime  BETWEEN '2019-10-01' AND '2019-10-31 23:59:59' 
AND trip_distance > 1 AND trip_distance <= 3; 

-- In between 3 (exclusive) and 7 miles (inclusive) 
SELECT COUNT(1) FROM public.green_taxi_trips
WHERE lpep_dropoff_datetime  BETWEEN '2019-10-01' AND '2019-10-31 23:59:59' 
AND trip_distance > 3 AND trip_distance <= 7 ;

-- In between 7 (exclusive) and 10 miles (inclusive) 
SELECT COUNT(1) FROM public.green_taxi_trips
WHERE lpep_dropoff_datetime  BETWEEN '2019-10-01' AND '2019-10-31 23:59:59' 
AND trip_distance > 7 AND trip_distance <= 10 ;

-- Over 10 miles 
SELECT COUNT(1) FROM public.green_taxi_trips
WHERE lpep_dropoff_datetime  BETWEEN '2019-10-01' AND '2019-10-31 23:59:59'  
AND trip_distance > 10 ;


Answers: 
104,802; 198,924; 109,603; 27,678; 35,189 

# Question 4. Longest trip for each day

# 2019-10-11 
select '2019-10-11' as time, AGE(lpep_dropoff_datetime::timestamp, lpep_pickup_datetime::timestamp) 
from public.green_taxi_trips 
where lpep_pickup_datetime BETWEEN '2019-10-11' AND '2019-10-11 23:59:59' 
order by AGE(lpep_dropoff_datetime::timestamp, lpep_pickup_datetime::timestamp) desc 
limit 1;

23:59:47 


# 2019-10-24 
select '2019-10-24' as time, AGE(lpep_dropoff_datetime::timestamp, lpep_pickup_datetime::timestamp) 
from public.green_taxi_trips 
where lpep_pickup_datetime BETWEEN '2019-10-24' AND '2019-10-24 23:59:59' 
order by AGE(lpep_dropoff_datetime::timestamp, lpep_pickup_datetime::timestamp) desc 
limit 1;

23:58:13


# 2019-10-26 
select '2019-10-26' as time, AGE(lpep_dropoff_datetime::timestamp, lpep_pickup_datetime::timestamp) 
from public.green_taxi_trips 
where lpep_pickup_datetime BETWEEN '2019-10-26' AND '2019-10-26 23:59:59' 
order by AGE(lpep_dropoff_datetime::timestamp, lpep_pickup_datetime::timestamp) desc 
limit 1;

23:58:59


# 2019-10-31 
select '2019-10-31' as time, AGE(lpep_dropoff_datetime::timestamp, lpep_pickup_datetime::timestamp) 
from public.green_taxi_trips 
where lpep_pickup_datetime BETWEEN '2019-10-31' AND '2019-10-31 23:59:59' 
order by AGE(lpep_dropoff_datetime::timestamp, lpep_pickup_datetime::timestamp) desc 
limit 1;

23:58:48


# Question 5. Three biggest pickup zones

select "Zone", sum(total_amount)  
from public.green_taxi_trips t 
left join zones z on t."PULocationID" = z."LocationID" 
where t.lpep_pickup_datetime BETWEEN '2019-10-18' AND '2019-10-18 23:59:59' 
group by "Zone" 
having sum(total_amount) >= 13000 

"Zone"	"sum"
"East Harlem North"	18686.680000000084
"East Harlem South"	16797.260000000057
"Morningside Heights"	13029.79000000003

# Question 6. Largest tip 
select z2."Zone" , sum(t.trip_distance)   
from public.green_taxi_trips t 
join zones z on t."PULocationID" = z."LocationID" 
join zones z2 on t."DOLocationID" = z2."LocationID" 
where t.lpep_pickup_datetime BETWEEN '2019-10-01' AND '2019-10-31 23:59:59' 
and z."Zone" = 'East Harlem North'
group by z2."Zone"  
order by sum(t.trip_distance) desc 
limit 10; 

"Zone"	"sum"
"East Harlem South"	6101.360000000012


# Question 7. Terraform Workflow
Which of the following sequences, respectively, describes the workflow for:

Downloading the provider plugins and setting up backend,
Generating proposed changes and auto-executing the plan
Remove all resources managed by terraform`
Answers:

terraform init, terraform apply -auto-approve, terraform destroy

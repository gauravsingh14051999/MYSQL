-- 6.1 List all the scientists' names, their projects' names, 
    -- and the hours worked by that scientist on each project, 
    -- in alphabetical order of project name, then scientist name.
Select s.name,p.name,p.hours from assignedto a 
join scientists s on a.Scientist=s.SSN 
join projects p on a.Project=p.code;
    
    
-- 6.2 Select the project names which are not assigned yet
select p.code, p.name from projects p 
left join assignedto a  on p.code=a.Project 
where a.Project is null;
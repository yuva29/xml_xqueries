xquery version "1.0";


<query3>
{
let $wong := doc("company.xml")//Employee[empName='Wong' ]/empId
let $smith := doc("company.xml")//Employee[empName='PSmith' ]/empId

for $dept in doc("company.xml")//Department return
	if( exists(doc("company.xml")//Division[housedDeptId=$dept/deptId and managerEmpId=$smith]/divId) and not(exists(doc("company.xml")//Division[housedDeptId=$dept/deptId and managerEmpId=$wong]/divId)) ) then <Department>{concat($dept/deptName,'','')}</Department> else ()	
}
</query3>
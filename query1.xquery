xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";
declare option ext:output "indent=yes";

<query1>
{
for $emp in doc("company.xml")//Employee where $emp[empName='PSmith'] or $emp[empName='Jack'] return
	for $wf in doc("company.xml")//WorksFor where $wf[empId=$emp/empId]  and $wf[percentTime>=50] return
		for $div in doc("company.xml")//Division where $div[divId=$wf/divId] return
			for $dept in doc("company.xml")//Department where $dept[deptId=$div/housedDeptId]
				return (<result>{concat($emp/empName,",",$dept/deptName)}</result>,"&#xa;")
}
</query1>

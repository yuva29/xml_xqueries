xquery version "1.0";
declare namespace ext="http://www.altova.com/xslt-extensions";
declare option ext:output "indent=yes";

<query4>
{
for $emp in doc("company.xml")//Employee return
	if(not(exists(doc("company.xml")//Division[managerEmpId=$emp/empId]/divId))) then (
	<employee>
	<empName>{concat($emp/empName,'','')}</empName>
	<empPhone>{concat($emp/empPhone,'','')}</empPhone>
	<empOffice>{concat($emp/empOffice,'','')}</empOffice>
	</employee>
	)
	else ()
}
</query4>

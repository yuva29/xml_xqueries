xquery version "1.0";

<query2>
{
let $emp_count := count(doc("company.xml")//Employee) 
for $div in doc("company.xml")//Division  
	let $wf := count(distinct-values(doc("company.xml")//WorksFor[divId=$div/divId]/empId)) return 
	if($emp_count = $wf ) then
		<division>
			{concat($div[divId]/divName,'','')}
		</division>
	else ()
}
</query2>


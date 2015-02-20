xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";
<query5>
{
let $emp := doc("company.xml")/Company/Employees/Employee
let $empcount := count( $emp/empId )
let $wf := doc("company.xml")/Company/WF/WorksFor
let $divCount := count($wf/divId)
let $result := $divCount div $empcount
return $result
}
</query5>

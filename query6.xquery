xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";
<query6>
{
(for $emp in doc("company.xml")//Employee
let $div := doc("company.xml")//Divisions/Division[managerEmpId=$emp/empId] 
order by count($div) descending
return <Employee name="{$emp/empName}" phone="{$emp/empPhone}" office="{$emp/empOffice}" divCount="{count($div)}"/>)[1]
}
</query6>
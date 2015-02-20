<?xml version="1.0" encoding="UTF-8"?>

<!-- New XSLT document created with EditiX XML Editor (http://www.editix.com) at Thu Nov 13 14:39:41 MST 2014 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
<xsl:template match="/">
<html>
<body>
<div style="background-color: yellow;color:red"><h2>Department Information</h2></div>
	<xsl:for-each select="//Departments/Department">
	<xsl:variable name="deptId" select="deptId"/>
	<p>Department <b><xsl:value-of select="deptName"/></b> houses <b><xsl:value-of select="count(/Company/Divisions/Division[housedDeptId=$deptId])"/></b> division(s):
		<xsl:for-each select="//Division">
			<xsl:if test="housedDeptId=$deptId">
			<b><xsl:value-of select="divName"/>,</b>
			</xsl:if>
		</xsl:for-each>
	</p>
	</xsl:for-each>
<div style="background-color: #ABFEE2;color:red"><h2>Employee Information</h2></div>
<xsl:for-each select="//Employees/Employee">
<xsl:variable name="empId" select="empId"></xsl:variable>
	<p>Employee <b><xsl:value-of select="empName"/></b> works from <b><xsl:value-of select="empOffice"/></b>. <b><xsl:value-of select="empName"/></b> works for <b><xsl:value-of select="count(/Company/WF/WorksFor[empId=$empId])"/></b>
	division(s), which are 
	<xsl:for-each select="//WF/WorksFor">
		<xsl:variable name="divId" select="divId"></xsl:variable>
		<xsl:if test="empId=$empId">
		 	<b><xsl:value-of select="/*/*/*[divId=$divId]/divName"/>,
</b>
		</xsl:if>
	</xsl:for-each>
	.<b><xsl:value-of select="empName"/></b> manages <b><xsl:value-of select="count(/Company/Divisions/Division[managerEmpId=$empId])"/></b> division(s)
	<xsl:if test="count(/Company/Divisions/Division[managerEmpId=$empId]) &gt; 0">
		, which are 
		<xsl:for-each select="/Company/Divisions/Division">
			<xsl:if test="managerEmpId=$empId">
				<b><xsl:value-of select="divName"/>,</b>
			</xsl:if>
		</xsl:for-each>
	</xsl:if>
	<b><xsl:value-of select="empName"/></b> works for most of the time with 
	<xsl:for-each select="/Company/WF/WorksFor[empId=$empId]">
	<xsl:sort select="percentTime" data-type="number" order="descending"/>
   	<xsl:if test="position() = 1">
   	<xsl:variable name="divId" select="divId"></xsl:variable>
   	<b><xsl:value-of select="/Company/Divisions/Division[divId=$divId]/divName"/></b>
   	</xsl:if>
	</xsl:for-each>
	</p>
</xsl:for-each>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

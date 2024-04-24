<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
 
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
 
<f:view>
<html>
    <head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                     background-color: #f0f8ff; /* Alice Blue */
                margin: 0;
                padding: 0;
                    
                }
 
                h2 {
                    color: #333;
                    text-align: center;
                }
 
                table {
                    width: 80%;
                    margin: 20px auto;
                    border-collapse: collapse;
                }
 
                th, td {
                    border: 1px solid #ddd;
                    padding: 8px;
                    text-align: left;
                }
 
                th {
                    background-color: #f2f2f2;
                }
 
                .center {
                    text-align: center;
                }
 
                .subscribe-btn {
                    background-color: #4CAF50;
                    color: white;
                    border: none;
                    padding: 8px 16px;
                    text-align: center;
                    text-decoration: none;
                    display: inline-block;
                    font-size: 14px;
                    margin: 4px 2px;
                    cursor: pointer;
                }
            </style>
    
    
    
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h:form>
        		<center>
                <h2><h:outputText value="Policy Records"/></h2>
               
            
        <h:dataTable value="#{impl.showInsurancePlans()}" var="e" border="3">
              	    <h:column>
                    <f:facet name="header">
                    	<h:outputLabel value="Plan Id" />
                    </f:facet>
                    <h:outputText value="#{e.planId}"/>
                </h:column>
                    <h:column>
                     <f:facet name="header">
                    	<h:outputLabel value="Insurance Id" />
                    </f:facet>
                    <h:outputText value="#{e.insId}"/>
                </h:column>
                <h:column>
                     <f:facet name="header">
                    	<h:outputLabel value="Premium Amount" />
                    </f:facet>
                    <h:outputText value="#{e.premiumAmount}"/>
                </h:column>
                    <h:column>
                     <f:facet name="header">
                    	<h:outputLabel value="Coverage Amount" />
                    </f:facet>
                    <h:outputText value="#{e.coverageAmount}"/>
                </h:column>
                <h:column>
                     <f:facet name="header">
                    	<h:outputLabel value="Benifits" />
                    </f:facet>
                    <h:outputText value="#{e.benefits}"/>
                </h:column>
                
                
				<h:column>
				<f:facet name="header">
					<h:outputLabel value="Subscribe" />
				</f:facet>
				<h:commandButton action="#{ejbPolicy.redirectToTakePolicy(e.plan_id)}"
				value="Subscribe" styleClass="subscribe-btn" />
			</h:column>  
			             
        </h:dataTable>
        </center>             
        </h:form>
    </body>
</html>
</f:view>
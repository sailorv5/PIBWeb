<!DOCTYPE html>
<%@ page import="com.isfce.pidw.data.*" %>
<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> --%>
<html>





<c:if test="${empty module}">
    var1 is empty or null.
			<s:url value="2000-01-01" var="dateD" />
			<s:url value="2000-01-01" var="dateF" />
</c:if>


<c:if test="${not empty module}">
    var1 is NOT empty or null.
			<fmt:formatDate value="${module.dateDebut}" pattern="yyyy-MM-dd" var="dateD"/>
			<fmt:formatDate value="${module.dateFin}" pattern="yyyy-MM-dd" var="dateF"/>
</c:if>




	
	


<jsp:include page="../fragments/header.jsp">
	<jsp:param name="titre" value="module Résultats ISFCE" />
</jsp:include>

<div class="container">

	<c:choose>
		<%--  Pour un Ajout le paramètre "savedId" ne doit pas exister --%>
		
		<c:when test="${empty savedId}">
			<h1><s:message code="module.creer"/></h1>
		</c:when>
		<c:otherwise>
			<h1><s:message code="module.modifier"/></h1>
		</c:otherwise>
	</c:choose>
	
	
	<br />

	<s:url value="/module/add" var="moduleActionUrl" />

	<%-- modelAttribute correspond à une clé dans le modèle --%>
	<sf:form method="POST" class="form-horizontal" modelAttribute="module"
		action="${moduleActionUrl}">

		<%-- affiche une div avec toutes les erreurs --%>
		<sf:errors path="*" element="div" cssClass="alert alert-danger" />


		<s:bind path="code">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<sf:label path="code" class="col-sm-2 control-label">
					<s:message code="module.code" />
				</sf:label>
				<div class="col-sm-10">
					<sf:input path="code" id="code" class="form-control"
						placeholder="Code du module" />
					<sf:errors path="code" class="control-label" />

				</div>

			</div>
		</s:bind>

		
		<s:bind path="dateDebutTemp">
			<div class="form-group ${status.error ? 'has-error' : ''} ">
				<sf:label path="dateDebutTemp" class="col-sm-2 control-label">
					<s:message code="module.dateDebut" />
				</sf:label>
				<div class="col-sm-10">
					<sf:input path="dateDebutTemp" value="${dateD}" id="dateDebutTemp" pattern="yyyy-MM-dd"  type="date" class="form-control"
						 />
					<sf:errors path="dateDebutTemp" class="control-label" />
				</div>
			</div>
		</s:bind>


		<s:bind path="dateFinTemp">
			<div class="form-group ${status.error ? 'has-error' : ''} ">
				<sf:label path="dateFinTemp" class="col-sm-2 control-label">
					<s:message code="module.dateFin" />
				</sf:label>
				<div class="col-sm-10">
					<sf:input path="dateFinTemp" value="${dateF}" id="dateFinTemp" pattern="yyyy-MM-dd" type="date" class="form-control"
						/>
					<sf:errors path="dateFinTemp" class="control-label" />
				</div> 
			</div>
		</s:bind>


		
		
		<s:bind path="cours">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<sf:label path="cours" class="col-sm-2 control-label">
					<s:message code="module.cours" />
				</sf:label>
				<div class="col-sm-5">
					<s:message code="module.cours.defaut" var="lblValue" />
					
					<sf:select path="cours" class="form-control">
						<sf:option value="None" label="${lblValue}" />
						<sf:options items="${coursList}" />
					</sf:select>
					<sf:errors path="cours" class="control-label" />
				</div>
				<div class="col-sm-5"></div>

			</div>
		</s:bind>
		
		
		<s:bind path="moment">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<sf:label path="moment" class="col-sm-2 control-label">
					<s:message code="module.moment" />
				</sf:label>
				<div class="col-sm-5">
					
					<sf:select path="moment" class="form-control">
						<sf:options items="${momentList}" />
					</sf:select>
					<sf:errors path="moment" class="control-label" />
				</div>
				<div class="col-sm-5"></div>

			</div>
		</s:bind>
		

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<c:choose>
					<c:when test="${empty savedId}">
						<%--  Pour un Ajout le "savedId" ne doit pas exister --%>
						<button type="submit" class="btn-lg btn-primary pull-right">
							<s:message code="module.btAJout" />
						</button>
					</c:when>
					<c:otherwise>
						<%-- Pour un update "savedId" doit avoir l'identifiant avant l'update --%>
						<button type="submit" name="savedId" value="${savedId}"
							class="btn-lg btn-primary pull-right">
							<s:message code="module.btMaj" />
						</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

	</sf:form>
</div>
<jsp:include page="../fragments/footer.jsp" />
</html>
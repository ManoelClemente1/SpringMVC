<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="charset=UTF-8">
<title>Livros de Java, Android, Ruby e muito mais - Casa do código</title>
</head>
<body>
	
	<form:form action="{s:mvcUrl('PC#gravar').build()}" method="POST" commandName="produto">	
	
		<div>
			<label>Titulo</label>
			<form:input path="titulo"/> 
			<form:errors path="produto.titulo"/>
		</div>
		<div>
			<label>Descrição</label>
			<form:textarea rows="10" cols="20" path="descricao"/> 
			<form:errors path="produto.descricao"/>
		</div>
		<div>
			<label>Páginas</label>
			<form:input path="paginas"/>
			<form:errors path="produto.paginas"/>
		</div>
		<div>
			<label>Data de lançamento</label>
			<form:input path="dataLancamento"/>
			<form:errors path="dataLancamento"/>
		</div>
		<c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
			
		<div>
			<label>${tipoPreco}</label>
			<form:input path="precos[${status.index}].valor"/>
			<form:hidden path="precos[${status.index }].tipo" value="${tipoPreco}"/>
		</div>		
		
		</c:forEach>

		<button type="submit">Cadastrar</button>
	</form:form>
	
</body>
</html>
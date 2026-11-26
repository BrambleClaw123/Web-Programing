<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/ch08/includes/header.jsp" %>

<h1>Thanks for joining our email list</h1>
<p>Here is the information that you entered:</p>

<label>Email:</label>
<span>${requestScope.user.email}</span><br>
<label>First Name:</label>
<span>${requestScope.user.firstName}</span><br>
<label>Last Name:</label>
<span>${requestScope.user.lastName}</span><br>

<p>To enter another email address, click on the Back
    button in your browser or the Return button shown below.</p>

<form action="<c:url value='/emailList'/>" method="get">
    <input type="hidden" name="action" value="join">
    <input type="submit" value="Return">
</form>

<hr>
<p>Current date: ${requestScope.currentDate}</p>
<p>First user in the list: ${sessionScope.users[0].firstName} ${sessionScope.users[0].lastName}
    (${sessionScope.users[0].email})</p>
<p>Second user in the list: ${sessionScope.users[1].firstName} ${sessionScope.users[1].lastName}
    (${sessionScope.users[1].email})</p>
<p>For customer service, contact us at
    <a href="mailto:${initParam.custServEmail}">${initParam.custServEmail}</a></p>

<%@ include file="/ch08/includes/footer.jsp" %>

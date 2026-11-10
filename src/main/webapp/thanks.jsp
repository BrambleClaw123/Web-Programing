<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
    <style>
        label {
            width: 11em;
        }
        span {
            display: inline-block;
            margin-left: 0.5em;
            margin-bottom: 0.5em;
        }
    </style>
</head>
<body>
<h1>Thanks for taking our survey</h1>
<p>Here is the information that you entered:</p>

<label>First Name:</label>
<span>${user.firstName}</span><br>

<label>Last Name:</label>
<span>${user.lastName}</span><br>

<label>Email:</label>
<span>${user.email}</span><br>

<label>Date of Birth:</label>
<span>${user.dateOfBirth}</span><br>

<label>Heard From:</label>
<span>${survey.heardFrom}</span><br>

<label>Receive Updates:</label>
<span>${survey.wantsUpdates == true ? "Yes" : "No"}</span><br>

<label>Receive Email:</label>
<span>${survey.wantsEmail == true ? "Yes" : "No"}</span><br>

<label>Contact Via:</label>
<span>${survey.contactVia}</span><br>

<p>To enter another survey, click on the Back button in your browser or the Return button shown below.</p>

<!-- Nút quay lại trang khảo sát ban đầu -->
<form action="index.html" method="get">
    <input type="hidden" name="action" value="join">
    <input type="submit" value="Return" id="submit">
</form>
</body>
</html>
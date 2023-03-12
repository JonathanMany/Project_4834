<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ResumeBuilder.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="CSS/StyleSheet1.css" />
    <script>
        function validateInput() {
            // Validate username
            var username = document.getElementById("txtUsername").value;
            if (!/^[a-zA-Z0-9]{1,30}$/.test(username)) {
                alert("Username must be alphanumeric and no more than 30 characters long.");
                return false;
            }

            // Validate email
            var email = document.getElementById("txtEmail").value;
            if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            // Validate password
            var password = document.getElementById("txtPassword").value;
            if (!/(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}/.test(password)) {
                alert("Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character.");
                return false;
            }

            // Validation passed
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateInput();">
    <h1>Resume Builder: Create an Account</h1>
    <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
    <asp:TextBox ID="txtUsername" runat="server" required></asp:TextBox>

    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
    <asp:TextBox ID="txtEmail" runat="server" required></asp:TextBox>

    <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" required></asp:TextBox>

    <asp:Button ID="btnCreateAccount" runat="server" Text="Create Account" OnClick="btnCreateAccount_Click" />
    </form>
</body>
</html>





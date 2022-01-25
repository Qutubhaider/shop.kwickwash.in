<%@ Page Language="C#" AutoEventWireup="true" CodeFile="update-counter.aspx.cs" Inherits="update_counter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <asp:Button ID="btnSave" runat="server" Text="Admin Submit" OnClick="btnSave_Click1" />
       <asp:Button ID="Button1" runat="server" Text="User Submit" OnClick="btnSave_Click" />
    </form>
</body>
</html>

<%@ Page Title="Login" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="prjPOE_ASP_Framework.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="dropshadow" style="text-align: center; margin: 10% auto; width: 25%">
        <asp:Image Width="100%" runat="server" ImageUrl="~/Images/UniManageApp-logos_black-cropped.png" />
        <asp:Table CssClass="aspTable" runat="server" ID="tbl">
            <asp:TableRow CssClass="aspTblRow">
                <asp:TableCell CssClass="aspTblCell" ColumnSpan="2" Width="100%">
                    <div style="width: 80%; margin-top: 2vh; margin-left: 10%; margin-right: 10%;">
                        <%--<asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>--%>
                        <asp:TextBox CssClass="aspTextBox" placeholder="Username" ID="edtUsername" runat="server" Width="100%"></asp:TextBox>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow CssClass="aspTblRow">
                <asp:TableCell CssClass="aspTblCell" ColumnSpan="2" Width="100%">
                    <div style="width: 80%; margin-top: 1vh; margin-left: 10%; margin-right: 10%;">
                        <%--<asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>--%>
                        <asp:TextBox CssClass="aspTextBox" placeholder="Password" ID="edtPassword" runat="server" Width="100%" TextMode="Password"></asp:TextBox>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow CssClass="aspTblRow">
                <asp:TableCell CssClass="aspTblCell" Width="50%">
                    <div style="margin-top: 2vh">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="aspButton" OnClick="btnRegister_Click" />
                    </div>
                </asp:TableCell>
                <asp:TableCell CssClass="aspTblCell" Width="50%">
                    <div style="margin-top: 2vh">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="aspButton" OnClick="btnLogin_Click" />
                    </div>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>

    <style>
        #dropshadow {
            border: 2px solid #084e62;
            padding: 10px;
            box-shadow: 5px 10px 8px #888888;
            border-radius: 5px;
        }

        .aspTextBox {
            border-radius: 15px;
            padding: 5px 10px 5px 10px;
            text-align: center;
            border-color: #074E62;
        }

        .aspTblHeader {
            font-size: 48px;
            text-align: center;
        }

        .aspTable {
            width: 100%;
        }

        .aspTblRow {
        }

        .aspTblCell {
        }

        .aspButton {
            width: 90%;
            background-color: rgb(189,211,65);
            border: 2px solid #074E62;
            border-radius: 5px;
            color: #074E62;
            padding: 5px;
            margin: 10px 5px 5px 5px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 18px;
        }
    </style>
</asp:Content>

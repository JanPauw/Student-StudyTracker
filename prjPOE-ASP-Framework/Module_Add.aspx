<%@ Page Title="Add a Module" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Module_Add.aspx.cs" Inherits="prjPOE_ASP_Framework.Module_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin: 15vh auto; width: 30%; text-align: center;">
        <h1 style="color: #084E62;">Add Module</h1>
        <div style="width: 80%; margin-left: 10%; margin-right: 10%">
            <asp:Table runat="server" ID="tblAddModule" Width="100%">
                <asp:TableRow>
                    <asp:TableHeaderCell CssClass="aspHeadCell" Enabled="False">Module Code</asp:TableHeaderCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <div style="width: 100%;">
                            <%--<asp:TableHeaderCell>Module Code</asp:TableHeaderCell>--%>
                            <asp:TextBox placeholder="Module Code" CssClass="aspTextBox" ID="edtModuleCode" runat="server" Width="100%"></asp:TextBox>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableHeaderCell CssClass="aspHeadCell">Module Name</asp:TableHeaderCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <div style="width: 100%;">
                            <%--<asp:TableHeaderCell>Module Name</asp:TableHeaderCell>--%>
                            <asp:TextBox placeholder="Module Name" CssClass="aspTextBox" ID="edtModuleName" runat="server" Width="100%"></asp:TextBox>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableHeaderCell CssClass="aspHeadCell">Number of Credits</asp:TableHeaderCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <div style="width: 100%;">
                            <%--<asp:TableHeaderCell>Number of Credits</asp:TableHeaderCell>--%>
                            <asp:TextBox placeholder="Number of Credits" CssClass="aspTextBox" ID="edtCredits" runat="server" Width="100%"></asp:TextBox>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableHeaderCell CssClass="aspHeadCell">Class Hours per Week</asp:TableHeaderCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <div style="width: 100%;">
                            <%--<asp:TableHeaderCell>Class Hours per Week</asp:TableHeaderCell>--%>
                            <asp:TextBox placeholder="Class Hours per Week" CssClass="aspTextBox" ID="edtClassHours" runat="server" Width="100%"></asp:TextBox>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>

        <div style="margin-top: 2vh">
            <asp:Table runat="server" ID="tblButtons" Width="100%">
                <asp:TableRow>
                    <asp:TableCell Width="50%">
                        <asp:Button CssClass="aspButton" ID="btnAdd" runat="server" Text="Add Module" OnClick="btnAdd_Click" />
                    </asp:TableCell>
                    <asp:TableCell Width="50%">
                        <asp:Button CssClass="aspButton" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </div>

    <style>
        .aspHeadCell {
            font-weight: bold;
            font-size: 18px;
            color: #074E62;
        }

        .aspButton {
            width: 90%;
            background-color: rgb(189,211,65);
            border: 2px solid #074E62;
            border-radius: 5px;
            color: #074E62;
            padding: 5px 10px 5px 10px;
            margin: 10% 5% 5% 5%;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 18px;
        }

        .aspTextBox {
            border-radius: 15px;
            padding: 5px 10px 5px 10px;
            text-align: center;
            border-color: #074E62;
        }
    </style>
</asp:Content>

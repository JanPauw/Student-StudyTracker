<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Semester_Info.aspx.cs" Inherits="prjPOE_ASP_Framework.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin: 15vh auto; width: 30%; text-align: center;">
        <h1 style="color: #084E62;">Semester Info</h1>
        <div style="width: 80%; margin-left: 10%; margin-right: 10%">
            <asp:Table ID="tblSemLength" runat="server" Width="100%">
                <asp:TableRow>
                    <asp:TableHeaderCell CssClass="aspHeadCell" ColumnSpan="2">Semester Length in Weeks:</asp:TableHeaderCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <div>
                            <asp:TextBox CssClass="aspTextBox" ID="edtSemWeeks" runat="server" Width="100%"></asp:TextBox>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableHeaderCell CssClass="aspHeadCell" ColumnSpan="2">Date of Semester's First Week:</asp:TableHeaderCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <div style="width: 100%;">
                            <asp:Calendar Width="100%" ID="dateSemStart" runat="server" BorderColor="#084E62" DayHeaderStyle-BackColor="#084E62" DayHeaderStyle-ForeColor="White" SelectedDayStyle-BackColor="#084E62" SelectedDayStyle-ForeColor="#BBD24D" TitleStyle-BackColor="#084E62" TitleStyle-ForeColor="#BBD24D" BorderStyle="Solid" ForeColor="#084E62" NextPrevStyle-ForeColor="#BDD341"></asp:Calendar>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
        <div style="margin-top: 2vh">
            <asp:Table CssClass="aspTable" Width="100%" ID="tblButtons" runat="server">
                <asp:TableRow>
                    <asp:TableCell Width="50%">
                        <asp:Button CssClass="aspButton" ID="btnSemSave" runat="server" Text="Save" OnClick="btnSemSave_Click" />
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

        .aspTable {
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

<%@ Page Title="Semester and Modules" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Semester.aspx.cs" Inherits="prjPOE_ASP_Framework.Semester" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="border-bottom: 1px solid grey">
        <h1>Semester Info</h1>
        <div style="float: right; margin-top: 2vh;">
            <asp:Button CssClass="aspButton" ID="btnEditInfo" runat="server" Text="Edit Info" Width="90px" OnClick="btnEditInfo_Click" />
        </div>
        <hr />
        <div class="float-container">
            <div class="float-child">
                <asp:Table CssClass="aspTable" ID="tblSemLength" runat="server">
                    <asp:TableRow>
                        <asp:TableHeaderCell>Semester length in weeks:</asp:TableHeaderCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblSemLengthValue" runat="server" Text="Not Set"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>

            <div class="float-child">
                <asp:Table CssClass="aspTable" ID="tblSemStart" runat="server">
                    <asp:TableRow>
                        <asp:TableHeaderCell>Semester first week start date:</asp:TableHeaderCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblSemStartValue" runat="server" Text="Not Set"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
    </div>
    <div style="margin-top: 18vh">
        <h1 class="moduleList">Semester Modules</h1>
        <div style="float: right; margin-top: 2vh;">
            <asp:Button ID="btnAddModule" runat="server" Text="Add a Module" CssClass="aspButton" OnClick="btnAddModule_Click" />
            <asp:Button ID="btnRecordHours" autopostback="false" runat="server" Text="Record Hours" CssClass="aspButton" OnClick="btnRecordHours_Click" />
        </div>
        <hr />
        <div style="width: 100%;" id="divModules" runat="server">
        </div>
    </div>

    <style>
        .float-container {
        }

        .float-child {
            width: 50%;
            float: left;
        }

        .aspTable {
            width: 100%;
        }

        .aspButton {
            background-color: rgb(189,211,65);
            border: 2px solid #074E62;
            color: #074E62;
            border-radius: 5px;
            padding: 5px 10px 5px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 18px;
        }

        h1 {
            margin: 20px 0 0 0;
            display: inline-block;
            color: #084E62;
        }

        th {
            font-size: 18px;
            background-color: #084E62;
            color: white;
        }

        table a {
            font-weight: bold;
            font-size: 17px;
        }

        td {
            font-size: 15px;
        }

        tr {
            border-bottom: 1px solid #ddd;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</asp:Content>



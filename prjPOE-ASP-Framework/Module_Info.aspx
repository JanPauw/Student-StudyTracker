<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Module_Info.aspx.cs" Inherits="prjPOE_ASP_Framework.WebForm2" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="dropshadow" style="width: 100%; margin-top: 15vh; padding:10px;">
        <div runat="server" id="divChart" style="display:inline-block; width: 50%; text-align: center; border: 2px solid #084e62; border-radius: 5px;">
            <h1 style="color: #084E62;">Study History</h1>
            <asp:Chart Width="500" Height="404" ID="StudyGraph" runat="server" AlternateText="No Recorded Study Hours Found!" LineWidth="0.5">
                <Series>
                    <asp:Series Name="series1" YValuesPerPoint="2"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="chartAreas">
                        <AxisX Title="Study Date" />
                        <AxisY Title="Hours Studied" />
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>

        <div style="float: right; width: 50%; text-align: center;">
            <h1 style="color: #084E62;">Module Info</h1>
            <div style="width: 50%; margin: 0 auto;">
                <asp:Table runat="server" ID="tblAddModule" Width="100%">
                    <asp:TableRow>
                        <asp:TableHeaderCell CssClass="aspHeadCell" Enabled="False">Module Code</asp:TableHeaderCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:TextBox CssClass="aspTextBox" ReadOnly="true" ID="edtModuleCode" runat="server" Width="100%"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableHeaderCell CssClass="aspHeadCell">Module Name</asp:TableHeaderCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:TextBox CssClass="aspTextBox" ID="edtModuleName" runat="server" Width="100%"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableHeaderCell CssClass="aspHeadCell">Number of Credits</asp:TableHeaderCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:TextBox CssClass="aspTextBox" ID="edtCredits" runat="server" Width="100%"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableHeaderCell CssClass="aspHeadCell">Class Hours per Week</asp:TableHeaderCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:TextBox CssClass="aspTextBox" ID="edtClassHours" runat="server" Width="100%"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
            <div style="margin: 2vh;">
                <asp:Table CssClass="aspTable" Width="60%" runat="server" ID="tblButtons">
                    <asp:TableRow>
                        <asp:TableCell Width="50%">
                            <asp:Button CssClass="aspButton" ID="btnSave" runat="server" Text="Save Changes" OnClick="btnSave_Click" />
                        </asp:TableCell>
                        <asp:TableCell Width="50%">
                            <asp:Button CssClass="aspButton" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="50%">

                        </asp:TableCell>
                        <asp:TableCell Width="50%">
                            <asp:Button CssClass="aspButton" ForeColor="White" BackColor="#EA3F5F" ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete this module?');" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
    </div>
    <style>
        .dropshadow {
            border: 2px solid #084e62;
            padding: 10px;
            box-shadow: 5px 10px 8px #888888;
            border-radius: 5px;
        }

        #dropshadow {
            border: 2px solid #084e62;
            padding: 10px;
            box-shadow: 5px 10px 8px #888888;
            border-radius: 5px;
        }

        .aspHeadCell {
            font-weight: bold;
            font-size: 18px;
            color: #074E62;
        }

        .aspTable {
            margin: 0 auto;
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

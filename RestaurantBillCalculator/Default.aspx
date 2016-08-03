<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"/>
    <link href="Content/StyleSheet.css" rel="stylesheet" />
    <script type="text/javascript" src="canvasjs.min.js"></script>
    <script src="Scripts/canvasjs.min.js"></script>
    <script src="Scripts/chartScript.js"></script>
    <title>Restaurant Bill Calculator</title>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
</head>
<body>
    <header id="header" class="container">
        <h1>Restaurant Bill Calculator</h1>
        <h4>A calculator for splitting the bill</h4>
    </header>

    <form id="form1" runat="server">
    
    <div id="calculator" class="container">
        <div class="row">
            <div id="inputDiv" class="col-sm-5">
                <p>Total Bill: <br /> <asp:TextBox ID="billTB" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="billTB" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Please enter how much your bill came to." ValidationGroup="calculatorValidators">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="billTB" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Format is invalid!" Operator="DataTypeCheck" Type="Currency" ValidationGroup="calculatorValidators">*</asp:CompareValidator>
                    <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="billTB" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Out of range." MaximumValue="9999999999.99" MinimumValue="0" Type="Currency" ValidationGroup="calculatorValidators">*</asp:RangeValidator>
                </p>
                
                <p>No. of People: <br /> <asp:TextBox ID="peopleTB" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="peopleTB" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Please enter the number of people splitting the bill." ValidationGroup="calculatorValidators">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="peopleTB" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Please enter a number between 1 and 30." MaximumValue="30" MinimumValue="1" ValidationGroup="calculatorValidators" Type="Integer">*</asp:RangeValidator>
                </p>
                 
                <p>Percentage to Tip: <br /> <asp:TextBox ID="percentTB" runat="server"></asp:TextBox>% 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="percentTB" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Please enter a tip percentage." ValidationGroup="calculatorValidators">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="percentTB" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Please enter a number between 0 and 100" MaximumValue="100" MinimumValue="0" ValidationGroup="calculatorValidators" Type="Integer">*</asp:RangeValidator>
                </p>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="ErrorMessage" ValidationGroup="calculatorValidators" />
            </div>

            <div id="buttonDiv" class="col-sm-2">
                <asp:Button id="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" ValidationGroup="calculatorValidators" />
                <asp:Button id="ResetButton" runat="server" Text="Clear" OnClick="ResetButton_Click" />
            </div>

            <div id="outputDiv" class="col-sm-5">
                <p>Total to Pay: <br /> <asp:Label ID="toPay" runat="server" Text=""></asp:Label></p>
                <br />
                <br />
                <p>Total per Person: <br /> <asp:Label ID="perPerson" runat="server" Text=""></asp:Label></p>
                <br />
                <br />
                <p>Tip Amount: <br /> <asp:Label ID="tipTotal" runat="server" Text=""></asp:Label></p>
            </div>
        </div>
    </div>

    <div id="secondHeader" class="container">
        <h1>Meal Breakdown</h1>
        <h4>Visualise how your money was spent</h4>
    </div>

    <div id="graph" class="container">
        <div class="row">
            <div id="breakdown" class="col-sm-4">
                <p>Drink: <br /> <asp:TextBox ID="drinkTB" runat="server"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="drinkTB" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Please enter the total spent on drinks." ValidationGroup="graphValidators">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="drinkTB" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Format is invalid!" Operator="DataTypeCheck" Type="Currency" ValidationGroup="graphValidators">*</asp:CompareValidator>
                    <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="drinkTB" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Out of range." MaximumValue="999999.99" MinimumValue="0" Type="Currency" ValidationGroup="graphValidators">*</asp:RangeValidator>
                </p>

                <p>Starter: <br /> <asp:TextBox ID="starterTB" runat="server"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="starterTB" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Please enter the total spent on starters." ValidationGroup="graphValidators">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="starterTB" CssClass="fade" Display="Dynamic" ErrorMessage="Format is invalid!" Operator="DataTypeCheck" Type="Currency" ValidationGroup="graphValidators">*</asp:CompareValidator>
                    <asp:RangeValidator ID="RangeValidator5" runat="server" ControlToValidate="starterTB" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Out of range." MaximumValue="999999.99" MinimumValue="0" Type="Currency" ValidationGroup="graphValidators">*</asp:RangeValidator>
                </p>

                <p>Main: <br /> <asp:TextBox ID="mainTB" runat="server"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="mainTB" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Please enter the total spent on mains." ValidationGroup="graphValidators">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="mainTB" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Format is invalid&quot;" Operator="DataTypeCheck" Type="Currency" ValidationGroup="graphValidators">*</asp:CompareValidator>
                    <asp:RangeValidator ID="RangeValidator6" runat="server" ControlToValidate="mainTB" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Out of range." MaximumValue="999999.99" MinimumValue="0" Type="Currency" ValidationGroup="graphValidators">*</asp:RangeValidator>
                </p>

                <p>Dessert: <br /> <asp:TextBox ID="dessertTB" runat="server"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="dessertTB" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Please enter the total spent on desserts." ValidationGroup="graphValidators">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="dessertTB" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Format is invalid!" Operator="DataTypeCheck" Type="Currency" ValidationGroup="graphValidators">*</asp:CompareValidator>
                    <asp:RangeValidator ID="RangeValidator7" runat="server" ControlToValidate="dessertTB" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Out of range." MaximumValue="999999.99" MinimumValue="0" Type="Currency" ValidationGroup="graphValidators">*</asp:RangeValidator>
                </p>
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="ErrorMessage" ValidationGroup="graphValidators" />
            </div>

            <div id="chartBtn" class="col-sm-2">
                <asp:Button id="DrawGraph" runat="server" Text="Draw Graph" OnClick="DrawGraph_Click" ValidationGroup="graphValidators" />
            </div>

            <div id="chartContainer" class="col-sm-6" style="height: 300px; width: 40%;" ></div>
        </div>
    </div>
    </form>
</body>
</html>

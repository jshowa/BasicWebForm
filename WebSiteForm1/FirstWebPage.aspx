<%@ Page Language="C#" %>
<%@Import Namespace="System.Data" %>
<%@Import Namespace="System.Data.Common" %>
<%@Import Namespace="System.Data.SqlClient" %>
<%@Import Namespace="System.Net" %>
<%@Import Namespace="System.Net.Mail" %>

<!DOCTYPE html>

<script runat="server">

   
    protected void SubmitInfoButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                WebAppsSqlDataSource.Insert();

                SendEmail();

                ConfirmationLabel.Text = "Submission complete.";
            }
            catch (Exception ex)
            {
                ConfirmationLabel.Text = ex.ToString();
            }
            
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ConfirmationLabel.Text = "";

    }

    protected void SendEmail()
    {
        
        try
        {
            using (MailMessage message = new MailMessage())
            {
                message.From = new MailAddress("info@submitinfo.com");
                message.To.Add(new MailAddress(EmailAddressTextBox.Text.ToString()));
                message.Subject = "Thank you for submitting your info " + FirstNameTextBox.Text.ToString() + " " + LastNameTextBox.Text.ToString();
                message.Body = "Your submission has been successfully added to the database";
                SmtpClient client = new SmtpClient();
                client.Host = "smtp.gmail.com";
                client.Port = 587;
                client.EnableSsl = true;
                client.Timeout = 10000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential("emailaccount", "password");
                client.Send(message);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
            
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            $("[id$=BirthDateTxtBox]").datepicker({
                showOn: "button",
                buttonImageOnly: true,
                buttonText: "Pick a date...",
                yearRange: '1900:',
                changeMonth: true,
                changeYear: true,
                buttonImage: 'http://jqueryui.com/resources/demos/datepicker/images/calendar.gif'
            });
        });
  
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Enter your information.<br />
        <br />
        First name:<br />
        <asp:TextBox ID="FirstNameTextBox" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="FirstNameRequiredValidator" runat="server" ControlToValidate="FirstNameTextBox" Display="Dynamic" EnableClientScript="False" ErrorMessage="* Required">* Required</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="FirstNameValidator" runat="server" ControlToValidate="FirstNameTextBox" Display="Dynamic" EnableClientScript="False" ErrorMessage="Cannot contain numbers, control characters, or special characters." ValidationExpression="([\p{L}]|'|-)+">Cannot contain numbers, control characters, or special characters.</asp:RegularExpressionValidator>
        <br />
        <br />
        Last Name:<br />
        <asp:TextBox ID="LastNameTextBox" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="LastNameRequiredValidator0" runat="server" ControlToValidate="LastNameTextBox" Display="Dynamic" EnableClientScript="False" ErrorMessage="* Required">* Required</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="LastNameValidator" runat="server" ControlToValidate="LastNameTextBox" Display="Dynamic" EnableClientScript="False" ErrorMessage="Cannot contain numbers, control characters, or special characters." ValidationExpression="(\p{L}|-|')+">Cannot contain numbers, control characters, or special characters.</asp:RegularExpressionValidator>
        <br />
        <br />
        Birth Date:<br />
        <asp:TextBox ID="BirthDateTxtBox" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
        Email Address:<br />
        <asp:TextBox ID="EmailAddressTextBox" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="EmailRequiredValidator" runat="server" ControlToValidate="EmailAddressTextBox" Display="Dynamic" EnableClientScript="False" ErrorMessage="* Required">* Required</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="EmailFormatValidator" runat="server" ControlToValidate="EmailAddressTextBox" Display="Dynamic" EnableClientScript="False" ErrorMessage="Invalid Format!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Invalid Format!</asp:RegularExpressionValidator>
        <br />
        <br />
        Number of Dependents:<br />
        <asp:DropDownList ID="NumDependentsDropDownList" runat="server" ItemType="Integer">
            <asp:ListItem>0</asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
            <asp:ListItem>13</asp:ListItem>
            <asp:ListItem>14</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>16</asp:ListItem>
            <asp:ListItem>17</asp:ListItem>
            <asp:ListItem>18</asp:ListItem>
            <asp:ListItem>19</asp:ListItem>
            <asp:ListItem>20</asp:ListItem>
            <asp:ListItem>21</asp:ListItem>
            <asp:ListItem>22</asp:ListItem>
            <asp:ListItem>23</asp:ListItem>
            <asp:ListItem>24</asp:ListItem>
            <asp:ListItem>25</asp:ListItem>
            <asp:ListItem>26</asp:ListItem>
            <asp:ListItem>27</asp:ListItem>
            <asp:ListItem>28</asp:ListItem>
            <asp:ListItem>29</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="SubmitInfoButton" runat="server" Text="Submit Information" Width="129px" OnClick="SubmitInfoButton_Click" />
        <br />
        <br />
        <asp:Label ID="ConfirmationLabel" runat="server"></asp:Label>
        <asp:SqlDataSource ID="WebAppsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [PERSON_INFO] WHERE [Id] = @Id" InsertCommand="INSERT INTO [PERSON_INFO] ([FirstName], [LastName], [BirthDate], [DependentCnt], [EmailAddress]) VALUES (@FirstName, @LastName, @BirthDate, @DependentCnt, @EmailAddress)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [PERSON_INFO]" UpdateCommand="UPDATE [PERSON_INFO] SET [FirstName] = @FirstName, [LastName] = @LastName, [BirthDate] = @BirthDate, [DependentCnt] = @DependentCnt, [EmailAddress] = @EmailAddress WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:FormParameter Name="FirstName" Type="String" FormField="FirstNameTextBox"/>
                <asp:FormParameter Name="LastName" Type="String" FormField="LastNameTextBox"/>
                <asp:FormParameter Name="BirthDate" Type="DateTime" FormField="BirthDateTxtBox"/>
                <asp:FormParameter Name="DependentCnt" Type="Decimal" FormField="NumDependentsDropDownList"/>
                <asp:FormParameter Name="EmailAddress" Type="String" FormField="EmailAddressTextBox"/>
            </InsertParameters>
            <UpdateParameters>
                <asp:FormParameter Name="FirstName" Type="String" FormField="FirstNameTextBox"/>
                <asp:FormParameter Name="LastName" Type="String" FormField="LastNameTextBox"/>
                <asp:FormParameter Name="BirthDate" Type="DateTime" FormField="BirthDateTxtBox"/>
                <asp:FormParameter Name="DependentCnt" Type="Decimal" FormField="NumDependentsDropDownList"/>
                <asp:FormParameter Name="EmailAddress" Type="String" FormField="EmailAddressTextBox"/>
                <asp:FormParameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>

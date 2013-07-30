using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Admin_AddUser : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateUserWizard_CreatedUser(object sender, EventArgs e)
    {
        TextBox UserNameTextBox = (TextBox)CreateUserWizardStep.ContentTemplateContainer.FindControl("UserName");
        Roles.AddUserToRole(UserNameTextBox.Text, "admin");
       
    }
}
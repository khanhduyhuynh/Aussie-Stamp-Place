using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Admin_AddUserToRole : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void AddUserToRoleButton_Click(object sender, EventArgs e)
    {
        String role = RolesListBox.SelectedValue.ToString();
        String username = UsersListBox.SelectedValue.ToString();
        if (role != null && role != "" && username != null && username != "")
        {

            if (Roles.IsUserInRole(username, role))
            {
                MessageLabel.Text = "User " + username + " is already in the role " + role;
            }
            else
            {
                String[] currentRoles = Roles.GetRolesForUser(username);
               
                foreach (String roleName in Roles.GetAllRoles())
                {
                    if (currentRoles.Contains(roleName))
                    {
                        Roles.RemoveUserFromRole(username, roleName);
                    }
                }

                Roles.AddUserToRole(username, role);
                MessageLabel.Text = "User " + username + " added to role " + role;
            }
        }
        else
        {
            MessageLabel.Text = "Something wrong!!! Please check again!!!";
        }
        
    }
}
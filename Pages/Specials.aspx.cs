using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Specials : BasePage
{
    public String roleName = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    { 
        if (!Page.IsPostBack)
        {
            if (User.IsInRole("dealer"))
            {
                roleName = "dealer";
            }
            else
            {
                if (User.IsInRole("admin"))
                {
                    roleName = "admin";
                }
            }
        }

    }
}
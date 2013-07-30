using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string theme = Page.Theme;
            HttpCookie selectedTheme = Request.Cookies.Get("SelectedTheme");
            if (selectedTheme != null)
            {
                theme = selectedTheme.Value;
            }
            if (!string.IsNullOrEmpty(theme) && ThemeList.Items.FindByValue(theme) != null)
            {
                ThemeList.Items.FindByValue(theme).Selected = true;
            }
        }
    }
    protected void ThemeList_SelectedIndexChanged(object sender, EventArgs e)
    {
        HttpCookie theme = new HttpCookie("SelectedTheme");
        theme.Expires = DateTime.Now.AddMonths(3);
        theme.Value = ThemeList.SelectedValue;
        Response.Cookies.Add(theme);
        Response.Redirect(Request.Url.ToString());
    }
}

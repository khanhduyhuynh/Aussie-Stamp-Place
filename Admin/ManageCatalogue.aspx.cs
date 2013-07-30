using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageCatalogue : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Get("StampId") != null)
        {
            StampItemFormView.DefaultMode = FormViewMode.Insert;
        }
    }

    protected void StampItemFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        ManageCatalogueGridView.DataBind();
    }
    protected void StampItemFormView_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        e.Values["LastUpdate"] = DateTime.Now;
        String selectedCategory = ManageCatalogueDropDownList.SelectedValue.ToString();
        e.Values["Series"] = selectedCategory;
    }

}
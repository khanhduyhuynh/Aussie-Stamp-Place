using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Profile;
using Shopping;

public partial class Shopping_CartControl : System.Web.UI.UserControl
{
    static String sRet = String.Empty;
    protected void Page_Load(Object sender, EventArgs e)
    {
        if (Profile.SCart == null)
        {
            return;
        }
        if (!Page.IsPostBack)
        {
            String sPath = System.Web.HttpContext.Current.Request.Url.AbsolutePath;
            System.IO.FileInfo oInfo = new System.IO.FileInfo(sPath);
            sRet = oInfo.Name;
            if (sRet == "Checkout.aspx")
            {
                CheckoutLink.Visible = false;
            }
            ReBindGrid();
        }
        if (Profile.SCart.Items.Count == 0)
        {
            TotalLabel.Visible = false;
            CheckoutLink.Visible = false;
        }
    }
    protected void grdCart_RowEditing(Object sender, GridViewEditEventArgs e)
    {
        grdCart.EditIndex = e.NewEditIndex;
        ReBindGrid();
    }
    protected void grdCart_RowUpdating(Object sender, GridViewUpdateEventArgs e)
    {
        TextBox txtQuantity = (TextBox)grdCart.Rows[e.RowIndex].Cells[2].Controls[0];
        int Quantity = Convert.ToInt32(txtQuantity.Text);
        if (Quantity == 0)
        {
            Profile.SCart.Items.RemoveAt(e.RowIndex);
        }
        else
        {
            Profile.SCart.Items[e.RowIndex].Quantity = Quantity;
        }
        grdCart.EditIndex = -1;
        ReBindGrid();
    }
    protected void grdCart_RowCancelingEdit(Object sender, GridViewCancelEditEventArgs e)
    {
        grdCart.EditIndex = -1;
        ReBindGrid();
    }
    protected void grdCart_RowDeleting(Object sender, GridViewDeleteEventArgs e)
    {
        Profile.SCart.Items.RemoveAt(e.RowIndex);
        ReBindGrid();
        if (Profile.SCart.Items.Count == 0)
        {
            TotalLabel.Visible = false;
            CheckoutLink.Visible = false;
        }
    }
    private void ReBindGrid()
    {
        grdCart.DataSource = Profile.SCart.Items;
        DataBind();
        TotalLabel.Text = String.Format("Total:{0,19:C}", Profile.SCart.Total);
    }
}

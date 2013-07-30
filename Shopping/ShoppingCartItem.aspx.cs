using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shopping;

public partial class Shopping_ShoppingCartItem : BasePage
{
    static String prevPage = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            prevPage = Request.UrlReferrer.ToString();
            String prevPageName = prevPage.Substring(prevPage.LastIndexOf("/") + 1);

            String strQuery = "SELECT [StampId], [Name], [Price], [Picture] FROM [TabularStamps] WHERE ([StampId] = @StampId)";
            if (prevPageName.Equals("Specials.aspx"))
            {
                if (User.IsInRole("member"))
                {
                    strQuery = "SELECT [StampId], [Name], [Price] * 0.85 AS [Price], [Picture] FROM [TabularStamps] WHERE ([StampId] = @StampId)";
                }
                else
                {
                    if (User.IsInRole("dealer") || User.IsInRole("admin"))
                    {
                        strQuery = "SELECT [StampId], [Name], [Price] * 0.70 AS [Price], [Picture] FROM [TabularStamps] WHERE ([StampId] = @StampId)";
                    }
                }
            }
            StampDetailDataSource.SelectParameters.Add("StampId", Request.QueryString[0]);
            StampDetailDataSource.SelectCommand = strQuery;
            
            StampDetailDataList.DataBind();
            
        }

        
    }
    protected void AddToCartButton_Click(object sender, ImageClickEventArgs e)
    {
        int stampId = int.Parse(Request.QueryString["StampId"]);
        String name = ((Label)StampDetailDataList.Controls[0].FindControl("NameLabel")).Text;
        double price = double.Parse(((Label)StampDetailDataList.Controls[0].FindControl("PriceLabel")).Text);
        String picture = ((Label)StampDetailDataList.Controls[0].FindControl("PictureLabel")).Text;
        
        if (Profile.SCart == null)
        {
            Profile.SCart = new Shopping.Cart();
        }
        Profile.SCart.Insert(stampId, name, price, picture, 1);

        Response.Redirect("~/Shopping/ShoppingCartPage.aspx");
    }
    protected void BackButton_Click(object sender, EventArgs e)
    {
        Response.Redirect(prevPage);
    }
}
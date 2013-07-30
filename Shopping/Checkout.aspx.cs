using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Shopping;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Shopping_Checkout : BasePage
{
    void Page_Load(Object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Profile.SCart.Items.Count == 0)
            {
                NoCartlabel.Visible = true;
                CheckoutWizard.Visible = false;
            }
            if (User.Identity.IsAuthenticated)
            {
                CheckoutWizard.ActiveStepIndex = 1;
            }
            else
            {
                CheckoutWizard.ActiveStepIndex = 0;
            }
        }
    }
    // Nothing to do here because no address information when users register
    protected void chkUseProfileAddress_CheckedChanged(Object sender, System.EventArgs e )
    {
        
    }
    protected void CheckoutWizard_FinishButtonClick( Object sender, System.Web.UI.WebControls.WizardNavigationEventArgs e)
    {
        SqlConnection conn = null;
        SqlTransaction trans = null;
        SqlCommand cmd;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StampDatabaseConnectionString"].ConnectionString);
            conn. Open () ;
            trans= conn.BeginTransaction();
            cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.Transaction = trans;

            cmd.CommandText = "INSERT INTO Orders(MemberName, OrderDate, Name, Address, City, State, Postcode, Country, TotalPrice) " + "VALUES (@MemberName, @OrderDate, @Name, @Address, @City, @State, @PostCode, @Country, @TotalPrice)";
            cmd.Parameters.Add("@MemberName", SqlDbType.VarChar, 50);
            cmd.Parameters.Add("@OrderDate", SqlDbType.DateTime);
            cmd.Parameters.Add ("@Name" , SqlDbType. VarChar, 50) ;
            cmd.Parameters.Add("@Address", SqlDbType.VarChar, 50);
            cmd.Parameters.Add( "@City", SqlDbType. VarChar, 50);
            cmd.Parameters.Add("@State", SqlDbType.VarChar, 50);
            cmd.Parameters.Add("@PostCode", SqlDbType.VarChar, 50);
            cmd.Parameters.Add("@Country", SqlDbType.VarChar, 50);
            cmd.Parameters.Add("@TotalPrice", SqlDbType.Money);

            cmd.Parameters["@MemberName"].Value= User.Identity.Name;
            cmd.Parameters["@OrderDate"].Value= DateTime.Now;
            cmd.Parameters["@Name"].Value =((TextBox)CheckoutWizard.FindControl("txtName")).Text;
            cmd.Parameters["@Address"].Value =((TextBox)CheckoutWizard.FindControl("txtAddress")).Text;
            cmd.Parameters["@City"].Value =((TextBox)CheckoutWizard.FindControl ("txtCity")).Text;
            cmd.Parameters["@State"].Value = ((TextBox)CheckoutWizard.FindControl("txtState")).Text;
            cmd.Parameters["@PostCode"].Value = ((TextBox)CheckoutWizard.FindControl("txtPostCode")).Text;
            cmd.Parameters["@Country"].Value = ((TextBox)CheckoutWizard.FindControl("txtCountry")).Text;
            cmd.Parameters["@TotalPrice"].Value = Profile.SCart.Total;

            cmd.ExecuteNonQuery();

            cmd.CommandText = "Select @@Identity";
            cmd.Parameters.Clear();
           
            int OrderID = Convert.ToInt32(cmd.ExecuteScalar());
            cmd.CommandText = "INSERT INTO OrderLines(OrderId, StampId, Quantity, Price) " + "VALUES (@OrderId, @StampId, @Quantity, @Price)";
            cmd.Parameters.Clear();
            cmd.Parameters.Add("@OrderId", SqlDbType.Int);
            cmd.Parameters.Add("@StampId", SqlDbType.Int);
            cmd.Parameters.Add ("@Quantity", SqlDbType.Int);
            cmd.Parameters.Add("@Price", SqlDbType.Money);

            cmd.Parameters["@OrderId"].Value = OrderID;
            foreach (CartItem item in Profile.SCart.Items)
            {
                cmd.Parameters["@StampId"].Value = item.StampID;
                cmd.Parameters["@Quantity"].Value = item.Quantity;
                cmd.Parameters["@Price"].Value= item.Price;

                cmd.ExecuteNonQuery();
            }
            trans.Commit();
        }
        catch (SqlException SqlEx)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            throw new Exception("An error occurred while creating the order", SqlEx);
        }
        finally
        {
            if (conn != null)
            {
                conn.Close();
            }
        }

        Profile.SCart.Items.Clear();
        Response.Redirect("~/Pages/StampCatalogue.aspx");

    }
    protected void CheckoutWizard_NextButtonClick(Object sender, System.Web.UI.WebControls.WizardNavigationEventArgs e)
    {
        if (e.CurrentStepIndex == 0)
        {
            System.Web.UI.WebControls.Login l = (Login)CheckoutWizard.FindControl("userLogin");
            if (Membership.ValidateUser(l.UserName, l.Password))
            {
                FormsAuthentication.SetAuthCookie(l.UserName, l.RememberMeSet);
                e.Cancel = false;
            }
            else
            {
                l.InstructionText = "Your login attempt was not successful. Please try again.";
                l.InstructionTextStyle.ForeColor = System.Drawing.Color.Red;
                e.Cancel = true;
            }
        }
        else
        {
            if (!User.Identity.IsAuthenticated)
            {
                e.Cancel = true;
                CheckoutWizard.ActiveStepIndex = 0;
            }
        }
    }
    protected void CheckoutWizard_ActiveStepChanged( Object sender, System.EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            CheckoutWizard.ActiveStepIndex = 0;
        }
    }

}
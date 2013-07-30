using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace Shopping
{
    [Serializable]
    public class CartItem
    {
        private int _stampID;
        private String _name;
        private double _price;
        private String _picture;
        private int _quantity;
        private double _subTotal;

        public CartItem()
        {

        }
        public CartItem(int StampID, String Name, double Price, String Picture, int Quantity)
        {
            _stampID = StampID;
            _name = Name;
            _price = Price;
            _picture = Picture;
            _quantity = Quantity;
            _subTotal = Quantity * Price;

        }
        public int StampID
        {
            get
            {
                return _stampID;
            }
            set
            {
                _stampID = value;
            }
        }

        public String Name
        {
            get { return _name; }
            set { _name = value; }
        }

        public double Price
        {
            get 
            {
                /*if (HttpContext.Current.User.IsInRole("Dealer"))
                {
                    return (_price * 0.7);
                }

                if (HttpContext.Current.User.IsInRole("Member"))
                {

                    string queryString = "SELECT [OnSpecial] FROM [TabularStamps] Where StampId = " + _stampID;
                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["StampDatabaseConnectionString"].ToString());

                    SqlCommand command = new SqlCommand(queryString, connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    try
                    {
                        int onSpecial = Convert.ToInt32(reader["OnSpecial"]);
                        if (onSpecial == 1)
                        {
                            return (_price * 0.85);
                        }
                    }
                    catch (SqlException e)
                    {
                        throw e;
                    }
                }*/
            
                return _price;
            }
            set 
            { 
                _price = value;
                /*
                if (HttpContext.Current.User.IsInRole("Dealer"))
                {
                    _price = value * 0.70;
                }

                if (HttpContext.Current.User.IsInRole("Member"))
                {
                    string queryString = "SELECT [OnSpecial] FROM [TabularStamps] Where StampId = " + _stampID;
                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["StampDatabaseConnectionString"].ToString());

                    SqlCommand command = new SqlCommand(queryString, connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    try
                    {
                        int onSpecial = Convert.ToInt32(reader["OnSpecial"]);
                        if (onSpecial == 1)
                        {
                            _price = value * 0.85;
                        }
                    }
                    catch (Exception e)
                    {
                        throw e;
                    }
                }*/
            }
        }

        public String Picture
        {
            get { return _picture; }
            set { _picture = value; }
        }

        public int Quantity
        {
            get { return _quantity; }
            set { _quantity = value; }
        }

        public double SubTotal
        {
            get { return _quantity * _price; }

        }

    }

    [Serializable]
    public class Cart
    {
        private List<CartItem> _items;

        public Cart()
        {
            if (this._items == null)
            {
                this._items = new List<CartItem>();
            }
        }

        public List<CartItem> Items
        {
            get { return _items; }
            set { _items = value; }
        }

        public void Insert(int StampID, String Name, double Price, String Picture, int Quantity)
        {
            int ItemIndex = ItemIndexOfID(StampID);
            if (ItemIndex == -1)
            {
                CartItem NewItem = new CartItem();
                NewItem.StampID = StampID;
                NewItem.Name = Name;
                NewItem.Price = Price;
                NewItem.Picture = Picture;
                NewItem.Quantity = Quantity;

                _items.Add(NewItem);
            }
            else
            {
                if (Price != _items[ItemIndex].Price)
                {
                    CartItem NewItem = new CartItem();
                    NewItem.StampID = StampID;
                    NewItem.Name = Name;
                    NewItem.Price = Price;
                    NewItem.Picture = Picture;
                    NewItem.Quantity = Quantity;

                    _items.Add(NewItem);
                }
                else
                {
                    _items[ItemIndex].Quantity += 1;
                }
            }
        }

        public void Update(int RowID, int StampID, int Quantity, double Price)
        {
            CartItem Item = _items[RowID];
            Item.StampID = StampID;
            Item.Quantity = Quantity;
            Item.Price = Price;
        }

        public void DeleteItem(int RowID)
        {
            _items.RemoveAt(RowID);
        }

        private int ItemIndexOfID(int StampID)
        {
            int index = 0;
            foreach (CartItem item in _items)
            {
                if (item.StampID == StampID)
                {
                    return index;
                }
                index += 1;
            }
            return -1;
        }

        public double Total
        {
            get
            {
                double t = 0;
                if (_items == null)
                {
                    return 0;
                }
                foreach (CartItem Item in _items)
                {
                    t += Item.SubTotal;
                }
                return t;
            }
        }

    }
}

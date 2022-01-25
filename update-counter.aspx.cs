using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class update_counter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {       

        try
        {
            int TotalCustomer = 0, ToatlService = 0, TotalProduct = 0, TotalOrder = 0, TotalPendingOrder = 0, TotalCompletedOrder = 0, TotalDriver = 0;
            double TotalRevenue = 0.0, TotalCollection = 0.0, TotalOutstanding = 0.0;
            string query = "select * from tbl.login where role=4 and userid!=1210 ";
            DataSet ds = Database.get_DataSet(query);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string query_counter = "select count(*) as TotalCustomer from tbl.Profile where uplineid='" + dr["userid"].ToString() + "'" +
                    " select count(*)as ToatlService from tbl.myservice where userid='" + dr["userid"].ToString() + "' " +
                    " select count(*)as TotalProduct from tbl.myproduct where userid='" + dr["userid"].ToString() + "' " +
                    " select count(*)as TotalOrder from tbl.orders where suserid='" + dr["userid"].ToString() + "' " +
                    " select count(*)as TotalPendingOrder from tbl.orders where deliverystatus='' and suserid='" + dr["userid"].ToString() + "'" +
                    " select count(*)as TotalCompletedOrder from tbl.orders where deliverystatus='Delivered' and suserid='" + dr["userid"].ToString() + "'" +
                    " select sum(ttlPayableAmount)as TotalRevenue from tbl.orders where suserid='" + dr["userid"].ToString() + "'" +
                    " select sum(ttlPayableAmount)as TotalCollection from tbl.orders where status='Paid' and suserid='" + dr["userid"].ToString() + "'" +
                    " select sum(ttlPayableAmount)as TotalOutstanding  from tbl.orders where status='unpaid' and suserid='" + dr["userid"].ToString() + "'" +
                    " select count(*)as TotalDriver from tbl.driver where uplineid='" + dr["userid"].ToString() + "'";
                DataSet dscounter = Database.get_DataSet(query_counter);
                if (dscounter.Tables[0].Rows.Count > 0)
                {
                    TotalCustomer = Convert.ToInt32(dscounter.Tables[0].Rows[0]["TotalCustomer"]);
                }
                if (dscounter.Tables[1].Rows.Count > 0)
                {
                    ToatlService = Convert.ToInt32(dscounter.Tables[1].Rows[0]["ToatlService"]);
                }
                if (dscounter.Tables[2].Rows.Count > 0)
                {
                    TotalProduct = Convert.ToInt32(dscounter.Tables[2].Rows[0]["TotalProduct"]);
                }
                if (dscounter.Tables[3].Rows.Count > 0)
                {
                    TotalOrder = Convert.ToInt32(dscounter.Tables[3].Rows[0]["TotalOrder"]);
                }
                if (dscounter.Tables[4].Rows.Count > 0)
                {
                    TotalPendingOrder = Convert.ToInt32(dscounter.Tables[4].Rows[0]["TotalPendingOrder"]);
                }
                if (dscounter.Tables[5].Rows.Count > 0)
                {
                    TotalCompletedOrder = Convert.ToInt32(dscounter.Tables[5].Rows[0]["TotalCompletedOrder"]);
                }
                if (dscounter.Tables[6].Rows.Count > 0)
                {
                    TotalRevenue = Convert.ToDouble(dscounter.Tables[6].Rows[0]["TotalRevenue"]);
                }
                if (dscounter.Tables[7].Rows.Count > 0)
                {
                    TotalCollection = Convert.ToDouble(dscounter.Tables[7].Rows[0]["TotalCollection"]);
                }
                if (dscounter.Tables[8].Rows.Count > 0)
                {
                    TotalOutstanding = Convert.ToDouble(dscounter.Tables[8].Rows[0]["TotalOutstanding"]);
                }
                if (dscounter.Tables[9].Rows.Count > 0)
                {
                    TotalDriver = Convert.ToInt32(dscounter.Tables[9].Rows[0]["TotalDriver"]);
                }
                string query_update = "update tbl.ttlUserDashboard set ttlCustomer='" + TotalCustomer + "', ttlService='" + ToatlService
                    + "', ttlProduct='" + TotalProduct + "',ttlOrders='" + TotalOrder + "',ttlOrderPending='" + TotalPendingOrder
                    + "',ttlOrderCompleted='" + TotalCompletedOrder + "',ttlPayments='" + TotalRevenue + "',ttlPaymentsPending='" + TotalCollection
                    + "',ttlPaymentsCompleted='" + TotalOutstanding + "',ttlDeliveryCompleted='" + TotalCompletedOrder
                    + "',ttlDeliveryPending='" + TotalPendingOrder + "',ttlDriver='" + TotalDriver + "' where userid='" + dr["userid"].ToString() + "'";
                string res = Database.Execute(query_update);
            }
        }
        catch (Exception ex)
        {

        }
    }

    protected void btnSave_Click1(object sender, EventArgs e)
    {
        try
        {
            int TotalCustomer = 0, ToatlService = 0, TotalProduct = 0, TotalOrder = 0, TotalPendingOrder = 0, TotalCompletedOrder = 0, TotalDriver = 0;
            double TotalRevenue = 0.0, TotalCollection = 0.0, TotalOutstanding = 0.0;
            string query = "select * from tbl.login where role='9'";
            DataSet ds = Database.get_DataSet(query);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string query_counter = "select count(*) as TotalCustomer from tbl.Profile" +
                    " select count(*)as ToatlService from tbl.service " +
                    " select count(*)as TotalProduct from tbl.product " +
                    " select count(*)as TotalOrder from tbl.orders " +
                    " select count(*)as TotalPendingOrder from tbl.orders where deliverystatus='' " +
                    " select count(*)as TotalCompletedOrder from tbl.orders where deliverystatus='Delivered' " +
                    " select sum(ttlPayableAmount)as TotalRevenue from tbl.orders " +
                    " select sum(ttlPayableAmount)as TotalCollection from tbl.orders where status='Paid' " +
                    " select sum(ttlPayableAmount)as TotalOutstanding  from tbl.orders where status='unpaid' " +
                    " select count(*)as TotalDriver from tbl.driver ";
                DataSet dscounter = Database.get_DataSet(query_counter);
                if (dscounter.Tables[0].Rows.Count > 0)
                {
                    TotalCustomer = Convert.ToInt32(dscounter.Tables[0].Rows[0]["TotalCustomer"]);
                }
                if (dscounter.Tables[1].Rows.Count > 0)
                {
                    ToatlService = Convert.ToInt32(dscounter.Tables[1].Rows[0]["ToatlService"]);
                }
                if (dscounter.Tables[2].Rows.Count > 0)
                {
                    TotalProduct = Convert.ToInt32(dscounter.Tables[2].Rows[0]["TotalProduct"]);
                }
                if (dscounter.Tables[3].Rows.Count > 0)
                {
                    TotalOrder = Convert.ToInt32(dscounter.Tables[3].Rows[0]["TotalOrder"]);
                }
                if (dscounter.Tables[4].Rows.Count > 0)
                {
                    TotalPendingOrder = Convert.ToInt32(dscounter.Tables[4].Rows[0]["TotalPendingOrder"]);
                }
                if (dscounter.Tables[5].Rows.Count > 0)
                {
                    TotalCompletedOrder = Convert.ToInt32(dscounter.Tables[5].Rows[0]["TotalCompletedOrder"]);
                }
                if (dscounter.Tables[6].Rows.Count > 0)
                {
                    TotalRevenue = Convert.ToDouble(dscounter.Tables[6].Rows[0]["TotalRevenue"]);
                }
                if (dscounter.Tables[7].Rows.Count > 0)
                {
                    TotalCollection = Convert.ToDouble(dscounter.Tables[7].Rows[0]["TotalCollection"]);
                }
                if (dscounter.Tables[8].Rows.Count > 0)
                {
                    TotalOutstanding = Convert.ToDouble(dscounter.Tables[8].Rows[0]["TotalOutstanding"]);
                }
                if (dscounter.Tables[9].Rows.Count > 0)
                {
                    TotalDriver = Convert.ToInt32(dscounter.Tables[9].Rows[0]["TotalDriver"]);
                }
                string query_update = "update tbl.ttlUserDashboard set ttlCustomer='" + TotalCustomer + "', ttlService='" + ToatlService
                    + "', ttlProduct='" + TotalProduct + "',ttlOrders='" + TotalOrder + "',ttlOrderPending='" + TotalPendingOrder
                    + "',ttlOrderCompleted='" + TotalCompletedOrder + "',ttlPayments='" + TotalRevenue + "',ttlPaymentsPending='" + TotalCollection
                    + "',ttlPaymentsCompleted='" + TotalOutstanding + "',ttlDeliveryCompleted='" + TotalCompletedOrder
                    + "',ttlDeliveryPending='" + TotalPendingOrder + "',ttlDriver='" + TotalDriver + "' where userid='1'";
                string res = Database.Execute(query_update);
            }
        }
        catch (Exception ex)
        {

        }
    }
}
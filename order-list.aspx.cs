using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
public partial class order_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["ActiveUser"] != null)
        {
            int id = Convert.ToInt32(HttpContext.Current.Session["ActiveUser"].ToString());
            int curr = 1, ctr = 0;

            string query = "select top 10 ad.ProdctName,ad.Qty,ad.Price,ad.TotalPrice,c.companyName,o.SUserid,o.ttlDiscount,o.ttlPayableAmount,o.paymentMode,o.deliveryStatus,o.orderId,o.invoiceNo,o.ttlQty,o.ttlAmount," +
                    "o.Status,p.name,p.mobile,o.orderDate,o.deliveryDate,o.OrderType,o.pickupRequest,o.dropRequest,o.pickupSlip from tbl.Orders o join tbl.profile p " +
                   "on p.userid=o.cuserid join tbl.CompanyProfile c on o.SUserid = c.Userid left join tbl.OrderAddOn ad on ad.OrderId=o.orderId where o.SUserid='" + id + "' order by o.orderId desc";
           
            //DataSet ds = Database.get_DataSet(query, "tbl.Orders", curr, 10);
            DataTable dt = Database.get_DataTable(query);
            StringBuilder _htmlTable = new StringBuilder();
            if (dt.Rows.Count > 0)
            {
                _htmlTable.AppendLine("<table id='myShopOrder' runat='server' class='display nowrap table table-hover table-striped table-bordered' cellspacing='0' width='100%'><thead><tr><th style='display:none;'>#</th><th>Order #</th><th>Customer Name</th>" +
                    "<th>Mobile No.</th><th>Amount</th><th>Status</th><th>Order Date</th><th>Delivery Date</th>" +
                    "<th>Barcode</th><th>Manage</th></tr></thead> <tbody id='listMyOrder'>");
                foreach (DataRow dr in dt.Rows)
                {
                    ctr++;                   
                    DateTime oDate = Convert.ToDateTime(dr["orderDate"]);
                    string orderDate = oDate.ToString("dd-MMM-yyyy hh:mm").ToString();
                    oDate = Convert.ToDateTime(dr["deliveryDate"]);
                    string deliveryDate = oDate.ToString("dd-MMM-yyyy hh:mm").ToString();
                    _htmlTable.AppendLine("<tr>");
                    _htmlTable.AppendLine("<td style='display: none); '>" + ctr + "</td>");
                    _htmlTable.AppendLine("<td>" + dr["orderId"].ToString() + "</td>");
                    _htmlTable.AppendLine("<td>"+ dr["name"].ToString() + "</td>");
                    _htmlTable.AppendLine("<td>" + dr["mobile"].ToString() + "</td>");
                    _htmlTable.AppendLine("<td>" + Math.Round(Convert.ToDecimal(dr["ttlPayableAmount"].ToString()), 2) + "</td>");
                    _htmlTable.AppendLine("<td>" + dr["Status"].ToString() + "</td>");
                    _htmlTable.AppendLine("<td>" + orderDate + "</td>");
                    _htmlTable.AppendLine("<td>" + deliveryDate + "</td>");
                    _htmlTable.AppendLine("<td class='text-center'>");
                    _htmlTable.AppendLine("<a class='btn btn-info' title='Barcode' target='_blank' href='barcode.html?oid=" + dr["orderId"].ToString() + ">View</a>");
                    _htmlTable.AppendLine("</td>");
                    _htmlTable.AppendLine("<td class='text-center'>");
                    _htmlTable.AppendLine("<a class='btn btn-success' title='Cart' target='_blank' href='order-inv.html?oid=" + dr["orderId"].ToString() + ">Order Details</a>");
                    _htmlTable.AppendLine("</td>");
                    _htmlTable.AppendLine("</tr>");
                }
                _htmlTable.AppendLine("</tbody></table>");
                divMyShopOrder.InnerHtml = _htmlTable.ToString();
            }
        }
    }
}
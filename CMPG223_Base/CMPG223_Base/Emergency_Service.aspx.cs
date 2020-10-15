using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CMPG223_Base
{
    public partial class Emergency_Service : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //toggle the username drop down list
            int i = rblAction.SelectedIndex;

            if (i == 1)
            {
                lblSelectService.Visible = true;
                drlServiceName.Visible = true;
                btnSubmit.Text = "Update";
            }
            else
            {
                lblSelectService.Visible = false;
                drlServiceName.Visible = false;
                //clear form
                //lblEmp_ID.Text = "";
                //txbFName.Text = "";
                //txbLName.Text = "";
                //txbUName.Text = "";
                //txbPassword.Text = "";
                //txbCNum.Text = "";
                //rblUserRole.SelectedIndex = -1;
                btnSubmit.Text = "Submit";
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
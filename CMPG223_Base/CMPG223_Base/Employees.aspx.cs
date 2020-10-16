using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CMPG223_Base
{
    public partial class Employees : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void rblAction_SelectedIndexChanged1(object sender, EventArgs e)
        {
            //toggle the username drop down list

            int i = rblAction.SelectedIndex;

            if(i == 1)
            {
                lblSelectEmp.Visible = true;
                drlUserName.Visible = true;
                btnCommit.Text = "Update";
            }
            else {
                lblSelectEmp.Visible = false;
                drlUserName.Visible = false;
                //clear form
                lblEmp_ID.Text = "";
                txbFName.Text = "";
                txbLName.Text = "";
                txbUName.Text = "";
                txbPassword.Text = "";
                txbCNum.Text = "";
                rblUserRole.SelectedIndex = -1;
                btnCommit.Text = "Submit";
            }
                
        }

        protected void drlUserName_SelectedIndexChanged1(object sender, EventArgs e)
        {
            //get user name to search
            string userName;
            userName = drlUserName.SelectedValue;

            //retrieve information and display relevant fields
            SqlCommand command;
            
            string sql;
            SqlConnection conn;
            string constr;
            constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CBOX_DB.mdf;Integrated Security=True";
            conn = new SqlConnection(constr);
            conn.Open();

            //read data from database
            int userRole = -1;
            sql = "Select * From EMPLOYEE WHERE EMPLOYEE_USERNAME = '"+@userName+"';";
            command = new SqlCommand(sql, conn);
            SqlDataReader dr = command.ExecuteReader();
            if (dr.Read())
            {

                lblEmp_ID.Text = dr["EMPLOYEE_ID"].ToString();
                txbFName.Text = dr["EMPLOYEE_FIRSTNAME"].ToString();
                txbLName.Text = dr["EMPLOYEE_LASTNAME"].ToString();
                txbUName.Text = dr["EMPLOYEE_USERNAME"].ToString();
                txbPassword.Text = dr["EMPLOYEE_PASSWORD"].ToString();
                txbCNum.Text = dr["EMPLOYEE_CONTACTNUMBER"].ToString();
                userRole = (int)dr["USERROLE"];
            }

            dr.Close();

            switch (userRole)
            {
                case 1:
                    rblUserRole.SelectedIndex = 0;
                    break;
                case 2:
                    rblUserRole.SelectedIndex = 1;
                    break;
                case 3:
                    rblUserRole.SelectedIndex = 2;
                    break;
                default:
                    break;
            }

            conn.Close();


        }

        protected void btnCommit_Click1(object sender, EventArgs e)
        {
            string fName, lName, uName, password, cNum, actionType;
            int userRole, empID;

            //get values from form            
            fName = txbFName.Text;
            lName = txbLName.Text;
            uName = txbUName.Text;
            password = txbPassword.Text;
            cNum = txbCNum.Text;
            userRole = rblUserRole.SelectedIndex + 1;
            actionType = btnCommit.Text;

            //test if username exists and add record
            if (actionType == "Submit")
            {
                
                //retrieve information and display relevant fields
                SqlCommand command;
                Boolean pause = false;
                string sql;
                SqlConnection conn;
                string constr;
                constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CBOX_DB.mdf;Integrated Security=True";
                conn = new SqlConnection(constr);
                conn.Open();

                //read data from database
                sql = "Select EMPLOYEE_USERNAME From EMPLOYEE;";
                command = new SqlCommand(sql, conn);
                SqlDataReader dr = command.ExecuteReader();
                while(dr.Read())
                {
                    if (dr["EMPLOYEE_USERNAME"].ToString() == uName)
                    {
                        txbUName.Text = "";
                        lblInvalid.Visible = true;
                        pause = true;
                        break;                        
                    }

                }
                dr.Close();

                //stops method if duplicate username appears
                if (pause)
                {
                    return;
                }
                

                //add new record
                SqlDataAdapter adapter = new SqlDataAdapter();
                sql = "Insert into EMPLOYEE(EMPLOYEE_FIRSTNAME,EMPLOYEE_LASTNAME, EMPLOYEE_USERNAME, EMPLOYEE_PASSWORD, EMPLOYEE_CONTACTNUMBER, USERROLE) values('" + @fName + "','" + @lName + "','" + @uName + "','" + @password + "','" + @cNum + "','" + userRole + "');";
                command = new SqlCommand(sql, conn);
                adapter.InsertCommand = new SqlCommand(sql, conn);
                adapter.InsertCommand.ExecuteNonQuery();
                command.Dispose();

                lblInvalid.Visible = false;
                conn.Close();

                //clear form
                lblEmp_ID.Text = "";
                txbFName.Text = "";
                txbLName.Text = "";
                txbUName.Text = "";
                txbPassword.Text = "";
                txbCNum.Text = "";
                rblUserRole.SelectedIndex = -1;

            }
            else if(actionType == "Update")
            {   // update record

                empID = int.Parse(lblEmp_ID.Text);

                if (uName == drlUserName.SelectedValue)
                {
                    uName = drlUserName.SelectedValue;
                    txbUName.Text = uName;
                }

                SqlCommand command;

                string sql;
                SqlConnection conn;
                string constr;
                constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CBOX_DB.mdf;Integrated Security=True";
                conn = new SqlConnection(constr);
                conn.Open();

                SqlDataAdapter adapter = new SqlDataAdapter();
                sql = "Update EMPLOYEE set EMPLOYEE_FIRSTNAME='" + @fName + "',EMPLOYEE_LASTNAME='" + @lName + "',EMPLOYEE_PASSWORD='" + @password + "',EMPLOYEE_CONTACTNUMBER='" + @cNum + "',USERROLE='" + @userRole + "' where EMPLOYEE_ID =" + @empID + ";";
                command = new SqlCommand(sql, conn);
                adapter.UpdateCommand = new SqlCommand(sql, conn);
                adapter.UpdateCommand.ExecuteNonQuery();
                command.Dispose();
                conn.Close();

                //clear form
                lblEmp_ID.Text = "";
                txbFName.Text = "";
                txbLName.Text = "";
                txbUName.Text = "";
                txbPassword.Text = "";
                txbCNum.Text = "";
                rblUserRole.SelectedIndex = -1;

            }
           
        }
    }
}
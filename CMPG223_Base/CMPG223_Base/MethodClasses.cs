using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace CMPG223_Base
{
    public class MethodClasses
    {
        public SqlConnection sqlConnectionObj;
        protected string DatabaseConnectionStr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='|DataDirectory|\\Database1.mdf';Integrated Security=True";
        
        public bool openDatabaseConnection()
        {
            sqlConnectionObj = new SqlConnection(DatabaseConnectionStr);
            try
            {
                sqlConnectionObj.Open();
                return true;
            }
            catch (Exception ErrorObj)
            {
                return false;
            }
        }

        public void closeDatabaseConnection()
        {
            try
            {
                sqlConnectionObj.Close();
            }
            catch (Exception ErrorObj)
            {
                throw;
            }
        }
    }
}
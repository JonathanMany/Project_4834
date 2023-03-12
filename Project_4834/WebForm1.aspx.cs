using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace ResumeBuilder
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            // Hash the password using the SHA256 algorithm
            byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
            byte[] hashBytes;
            using (var sha256 = SHA256.Create())
            {
                hashBytes = sha256.ComputeHash(passwordBytes);
            }
            string hashedPassword = Convert.ToBase64String(hashBytes);

            // Store the user data in the database
            string connectionString = "Data Source=L00000002FGT5D3;Initial Catalog=ResumeBuilder;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string insertQuery = "INSERT INTO users (username, email, password) VALUES (@username, @email, @password)";
                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@password", hashedPassword);
                    cmd.ExecuteNonQuery();
                }
                con.Close();
            }

            Response.Redirect("success.html");
        }
    }
}
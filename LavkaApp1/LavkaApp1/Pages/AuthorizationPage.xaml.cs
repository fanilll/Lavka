using LavkaApp1.Components;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace LavkaApp1.Pages
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationPage.xaml
    /// </summary>
    public partial class AuthorizationPage : Page
    {
        public static List<Users> users { get; set; }
        public static List<Masters> masters { get; set; }
        public AuthorizationPage()
        {
            InitializeComponent();
        }

        private void AuthBT_Click(object sender, RoutedEventArgs e)
        {
            string login = LoginTB.Text.Trim();
            string password = PasswordPB.Password.Trim();


            users = new List<Users>(App.db.Users.ToList());
            Users currentUser = users.FirstOrDefault(i => i.Email == login && i.PasswordHash == password);
            App.loginedUsers = currentUser;

            if (currentUser != null)
            {
                NavigationService.Navigate(new ListPage());
            }

            if (currentUser == null)
            {
                MessageBox.Show("Такого пользователя не существует");
            }
        }

        private void RegistrBT_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new RegistrationPage());
        }
    }
}

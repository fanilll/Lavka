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
    /// Логика взаимодействия для RegistrationPage.xaml
    /// </summary>
    public partial class RegistrationPage : Page
    {
        public static List<Users> users { get; set; }
        public static Users newUser = new Users();
        public RegistrationPage()
        {
            InitializeComponent();
            users = new List<Users>(App.db.Users.ToList());
            this.DataContext = this;
        }

        private void RegistrBT_Click(object sender, RoutedEventArgs e)
        {

            StringBuilder error = new StringBuilder();

            if (string.IsNullOrWhiteSpace(FullNameTB.Text) || string.IsNullOrWhiteSpace(LoginTB.Text) || string.IsNullOrWhiteSpace(PasswordPB.Password))
            {
                MessageBox.Show("Заполните все поля!");
                return;
            }

            var allUsersLogin = users.FirstOrDefault(x => x.Email == LoginTB.Text);
            if (allUsersLogin != null)
            {
                MessageBox.Show("Логин уже занят другим пользователем!");
                return;
            }

            newUser.FullName = FullNameTB.Text;
            newUser.Email = LoginTB.Text;
            newUser.PasswordHash = PasswordPB.Password;
            newUser.RoleID = 4;
            newUser.CreatedAt = DateTime.Now;
            App.db.Users.Add(newUser);
            App.db.SaveChanges();
            NavigationService.Navigate(new ListPage());


        }

        private void ExitBT_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AuthorizationPage());
        }
    }
}
